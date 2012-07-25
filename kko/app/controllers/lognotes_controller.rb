class LognotesController < ApplicationController
  before_filter :get_language
  before_filter :get_flashcard
  before_filter :get_log

  # GET /lognotes
  # GET /lognotes.json
  def index
    @lognotes = @log.lognotes.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lognotes }
    end
  end

  # GET /lognotes/1
  # GET /lognotes/1.json
  def show
    @lognote = @log.lognotes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lognote }
    end
  end

  # GET /lognotes/new
  # GET /lognotes/new.json
  def new
    @lognote = Lognote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lognote }
    end
  end

  # GET /lognotes/1/edit
  def edit
    @lognote = @log.lognotes.find(params[:id])
  end

  # POST /lognotes
  # POST /lognotes.json
  def create
    @lognote = @log.lognotes.build(params[:lognote])

    if @lognote.save
        flash[:success] = 'Lognote was successfully created.'
        redirect_to language_flashcard_log_path(@language, @flashcard, @log)
    else
        render "new"
    end
  end

  # PUT /lognotes/1
  # PUT /lognotes/1.json
  def update
    @lognote = @log.lognotes.find(params[:id])
 
    if @lognote.update_attributes(params[:lognote])
        flash[:success] = 'Lognote was successfully updated.'
        redirect_to language_flashcard_log_path(@language, @flashcard, @log)
    else
        render "edit"
    end
  end

  # DELETE /lognotes/1
  # DELETE /lognotes/1.json
  def destroy
    @lognote = Lognote.find(params[:id])
    @lognote.destroy
	flash[:success] = 'Lognote destroyed'
	
    redirect_to language_flashcard_log_path(@language, @flashcard, @log)
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
    
  def get_log
  	@log = Log.find(params[:log_id])
  	if @log.nil? then raise "No language does exist for this flashcard." end
  end
  
end
