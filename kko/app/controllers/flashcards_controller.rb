class FlashcardsController < ApplicationController
  before_filter :get_language

  # GET /flashcards
  # GET /flashcards.json
  def index
    @flashcards = @language.flashcards.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flashcards }
    end
  end

  # GET /flashcards/1
  # GET /flashcards/1.json
  def show
    @flashcard = @language.flashcards.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flashcard }
    end
  end

  # GET /flashcards/new
  # GET /flashcards/new.json
  def new
    @flashcard = Flashcard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flashcard }
    end
  end

  # GET /flashcards/1/edit
  def edit
    @flashcard = @language.flashcards.find(params[:id])
  end

  # POST /flashcards
  # POST /flashcards.json
  def create
    @flashcard = @language.flashcards.build(params[:flashcard])
    
    if @flashcard.save
        flash[:success] = 'Flashcard was successfully created.'
        redirect_to language_flashcards_path(@language)
    else
        render "new"
    end
      
  end

  # PUT /flashcards/1
  # PUT /flashcards/1.json
  def update
    @flashcard = @language.flashcards.find(params[:id])

    if @flashcard.update_attributes(params[:flashcard])
        flash[:success] = 'Flashcard was successfully updated.'
        redirect_to language_flashcards_path(@language)
    else
        render "edit"
    end
      
  end

  # DELETE /flashcards/1
  # DELETE /flashcards/1.json
  def destroy
    @flashcard = @language.flashcards.find(params[:id])
    @flashcard.destroy
	flash[:success] = 'Flashcard destroyed'
	
    redirect_to language_flashcards_path(@language)
  end
  
private

  def get_language
  	@language = Language.find(params[:language_id])
  	if @language.nil? then raise "No language does exist for this flashcard." end
  end
  

end
