class LogsController < ApplicationController
  before_filter :get_language
  before_filter :get_flashcard
  
  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @logs }
    end
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
    @log = @flashcard.logs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @log }
    end
  end

  # GET /logs/new
  # GET /logs/new.json
  def new
    @log = Log.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @log }
    end
  end

  # GET /logs/1/edit
  def edit
    @log = @flashcard.logs.find(params[:id])
  end

  # POST /logs
  # POST /logs.json
  def create
    @log = @flashcard.logs.build(params[:log])

    if @log.save
        flash[:success] = 'Log was successfully created.'
        redirect_to language_flashcard_path(@language, @flashcard)
    else
        render "new"
    end    
    
  end

  # PUT /logs/1
  # PUT /logs/1.json
  def update
    @log = @flashcard.logs.find(params[:id])
   
    if @log.update_attributes(params[:vocabulary])
        flash[:success] = 'Log was successfully updated.'
        redirect_to language_flashcard_path(@language, @flashcard)
    else
        render "edit"
    end
          
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log = Log.find(params[:id])
    @log.destroy
	flash[:success] = 'Log destroyed'

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
