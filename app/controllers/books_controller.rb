class BooksController < ApplicationController
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
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

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
