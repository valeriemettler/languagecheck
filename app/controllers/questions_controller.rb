class QuestionsController < ApplicationController
  before_action :set_language, except: [:index, :new]
  before_action :set_question, only: [:show, :edit, :update, :destroy]


  def index
    @questions = current_user.questions
    @unanswered_questions = @questions.select(&:unanswered)
    @answered_questions = @questions.select(&:answered)

    @answers = current_user.answers
    @questions_i_answered = @answers.collect(&:question).uniq || []
    @answers_voted_up = @answers.voted_up || []
    # authorize @question
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
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
     
     if @question.update_attributes(question_params)
       flash[:notice] = "Question was updated."
       redirect_to [@language, @question]
     else
       flash[:error] = "There was an error saving the question. Please try again."
       render :edit
     end
   end

  def create
    # @language = Language.find(params[:language_id])
     @question = Question.new(question_params)
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
  def destroy
    @question.destroy.find(params[:id])
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:id, :body)

    end
   
    def set_language
      @language = Language.find(params[:language_id])
    end
  
end
