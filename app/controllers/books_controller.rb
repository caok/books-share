class BooksController < ApplicationController
  load_and_authorize_resource
  # GET /books
  # GET /books.json
  def index
    case
    when params[:tag]
      @books = Book.tagged_with(params[:tag], :on => :tags, :any => true)
    when params[:author]
      @books = Book.tagged_with(params[:author], :on => :authors, :any => true)
    when params[:translator]
      @books = Book.tagged_with(params[:translator], :on => :translators, :any => true)
    when params[:q]
      search_options = {
          :with => {},
          :page => params[:page],
          :per_page => 2,
          :order => :created_at,
          :sort_mode => :desc
        }
      @books = Book.search sphinx_escape(params[:q]), search_options
    else
      @books = Book.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = current_user.books.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  def auto_new
    respond_to do |format|
      format.html
      format.json { render json: {:success=>true} }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.new(params[:book])

    respond_to do |format|
      if @book.save
        Attachment.create(:attachment => params[:book][:cover], :attachmenttable => @book) if params[:book][:cover]
        format.html { redirect_to @book, notice: I18n.t("flash.actions.create.notice") }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def auto_create
    book_info = Mini::Douban.book_api(:id => params[:douban][:index].to_s)
    respond_to do |format|
      unless book_info.respond_to? 'keys'
        flash[:error] = I18n.t('flash.books.actions.auto_create.douban_error')
        format.html { render action: "auto_new"}
        format.json { render json: {status: flash[:error]} }
      else
        @book = Book.generate(book_info)
        if @book.errors.blank?
          flash[:success] = I18n.t("flash.books.actions.auto_create.success")
          format.html { redirect_to @book  }
          format.json { render json: @book, status: :created, location: @book }
        else
          flash.now[:error] = I18n.t('flash.books.actions.auto_create.error')
          format.html { render action: "auto_new" }
          format.json { render json: book.errors }
        end
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        if params[:book][:cover]
          @book.attachment.destroy if @book.attachment
          Attachment.create(:attachment => params[:book][:cover], :attachmenttable => @book)
        end
        format.html { redirect_to @book, notice: I18n.t("flash.actions.update.notice") }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end
end
