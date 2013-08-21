class ResourcesController < ApplicationController
  load_and_authorize_resource

  before_filter :set_book_download_count, :only =>[:read, :send_to_kindle, :download]

  def new
    @resource = current_user.resources.new(:book_id => params[:book_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end

  def create
    @resource = current_user.resources.new(params[:resource])

    respond_to do |format|
      if @resource.save
        Attachment.create(:attachment => params[:resource][:file], :attachmenttable => @resource) if params[:resource][:file]
        format.html { redirect_to @resource.book, notice: I18n.t("flash.actions.create.notice") }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.json { head :ok }
      format.js
    end
  end

  def pdf2html
    @resource = Resource.find(params[:id])
    pdf_url = "public" + @resource.download_link
    html_url = "public" + @resource.pdf2html_link
    `pdf2htmlEX "#{pdf_url}" "#{html_url}"`
    @resource.update_attributes(:transformed => true)
    redirect_to :back
  end

  def read
    @resource = Resource.find(params[:id])
    render layout: false
  end

  def send_to_kindle
    resource = Resource.find(params[:id])
    #UserMailer.deliver_to_kindle(current_user, resource).deliver
    UserMailer.delay.deliver_to_kindle(current_user, resource)
    redirect_to :back, notice: "The book is sending to #{current_user.kindle_email}"
  end

  def download
    @resource = Resource.find(params[:id])
    case AttachmentUploader.storage.to_s
    when 'CarrierWave::Storage::File'
      send_data( File.read( "#{Rails.root}/public#{ URI.decode @resource.download_link}"),
          :filename => @resource.download_link.split('/').last.to_s
      )
    when 'CarrierWave::Storage::Qiniu'
      redirect_to @resource.download_link+"?download"
    else
      redirect_to @resource.download_link
    end
  end

  protected

  def set_book_download_count
    book = @resource.book
    return unless book
    book.download_count += 1
    book.save!
  end
end
