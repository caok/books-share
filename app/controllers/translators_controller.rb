class TranslatorsController < ApplicationController
  # GET /translators
  # GET /translators.json
  def index
    @translators = Translator.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @translators }
    end
  end

  # GET /translators/1
  # GET /translators/1.json
  def show
    @translator = Translator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @translator }
    end
  end

  # GET /translators/new
  # GET /translators/new.json
  def new
    @translator = Translator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @translator }
    end
  end

  # GET /translators/1/edit
  def edit
    @translator = Translator.find(params[:id])
  end

  # POST /translators
  # POST /translators.json
  def create
    @translator = Translator.new(params[:translator])

    respond_to do |format|
      if @translator.save
        format.html { redirect_to @translator, notice: 'Translator was successfully created.' }
        format.json { render json: @translator, status: :created, location: @translator }
      else
        format.html { render action: "new" }
        format.json { render json: @translator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /translators/1
  # PUT /translators/1.json
  def update
    @translator = Translator.find(params[:id])

    respond_to do |format|
      if @translator.update_attributes(params[:translator])
        format.html { redirect_to @translator, notice: 'Translator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @translator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translators/1
  # DELETE /translators/1.json
  def destroy
    @translator = Translator.find(params[:id])
    @translator.destroy

    respond_to do |format|
      format.html { redirect_to translators_url }
      format.json { head :no_content }
    end
  end
end
