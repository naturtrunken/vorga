class VocabulariesController < ApplicationController
  before_filter :get_language
  before_filter :get_flashcard
  
  # GET /vocabularies
  # GET /vocabularies.json
  def index
    @vocabularies = @flashcard.vocabularies.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vocabularies }
    end
  end

  # GET /vocabularies/1
  # GET /vocabularies/1.json
  def show
    @vocabulary = @flashcard.vocabularies.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vocabulary }
    end
  end

  # GET /vocabularies/new
  # GET /vocabularies/new.json
  def new
    @vocabulary = Vocabulary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vocabulary }
    end
  end

  # GET /vocabularies/1/edit
  def edit
    @vocabulary = @flashcard.vocabularies.find(params[:id])
  end

  # POST /vocabularies
  # POST /vocabularies.json
  def create
    @vocabulary = @flashcard.vocabularies.build(params[:vocabulary])

      if @vocabulary.save
        flash[:success] = 'Vocabulary was successfully created.'
        redirect_to language_flashcard_path(@language, @flashcard)
      else
        render "new"
      end
  end

  # PUT /vocabularies/1
  # PUT /vocabularies/1.json
  def update
    @vocabulary = @flashcard.vocabularies.find(params[:id])

      if @vocabulary.update_attributes(params[:vocabulary])
        flash[:success] = 'Vocabulary was successfully updated.'
        redirect_to language_flashcard_path(@language, @flashcard)
      else
        render "edit"
      end
  end

  # DELETE /vocabularies/1
  # DELETE /vocabularies/1.json
  def destroy
    @vocabulary = Vocabulary.find(params[:id])
    @vocabulary.destroy
	flash[:success] = 'Vocabulary destroyed'

    redirect_to language_flashcard_path(@language, @flashcard)
  end
  
private

  def get_flashcard
  	@flashcard = Flashcard.find(params[:flashcard_id])
  	if @flashcard.nil? then raise "No flashcard does exist for this vocabulary." end
  end
  
  def get_language
  	@language = Language.find(params[:language_id])
  	if @language.nil? then raise "No language does exist for this flashcard." end
  end
  
  
  
end
