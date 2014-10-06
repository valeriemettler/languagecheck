class QuestionsController < ApplicationController
  before_action :set_language, except: [:index]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = current_user.questions
    # authorize @question
  end

  def show
    @question = Question.find(params[:id])
    # @language = Language.find(params[:language_id])
  end

  def new
    # @language = Language.find(params[:language_id])
    @question = Question.new
    authorize @question
  end

  def edit
    # @language = Language.find(params[:language_id])
    @question = Question.find(params[:id])
    authorize @question
  end

  def update
    # @language = Language.find(params[:language_id])
     @question = Question.find(params[:id])
     authorize @question
     
     if @question.update_attributes(params.require(:question).permit(:body))
       flash[:notice] = "Question was updated."
       redirect_to [@language, @question]
     else
       flash[:error] = "There was an error saving the question. Please try again."
       render :edit
     end
   end

  def create
    # @language = Language.find(params[:language_id])
     @question = Question.new(params.require(:question).permit(:body))
     @question.language = @language
     @question.user = current_user
     authorize @question

     if @question.save
       flash[:notice] = "Question was saved."
       redirect_to [@language, @question]
     else
       flash[:error] = "There was an error saving the question. Please try again."
       Rails.logger.info ">>>>>>>> Question: #{@question.inspect}"
       Rails.logger.info ">>>>>>> Valid? #{@question.valid?}"
       Rails.logger.info ">>>> Errors: #{@question.errors.inspect}"
       render :new
     end
   end
  # def create
  #   @question = Question.new(question_params)

  #   respond_to do |format|
  #     if @question.save
  #       format.html { redirect_to @question, notice: 'Question was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @question }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @question.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  # def update
  #   respond_to do |format|
  #     if @question.update(question_params)
  #       format.html { redirect_to @question, notice: 'Question was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @question.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy.find(params[:id])
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:body)
    end

    def set_language
      @language = Language.find(params[:language_id])
    end
end
