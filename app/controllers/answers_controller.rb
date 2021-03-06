class AnswersController < ApplicationController
  before_action :set_language_and_question
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = Answer.all
      authorize @answers
  end

  def show
  end

  def new
    @answer = Answer.new
        authorize @answer
  end

  def edit


  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user = current_user
      authorize @answer

    respond_to do |format|
      if @answer.save
        format.html { redirect_to [@language, @question], notice: 'Answer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @answer }
      else
        format.html { redirect_to [@language, @question], error: 'Answer was  not successfully created.' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end

  private

    def set_answer
      @answer = Answer.find(params[:id])
      @answer ||= @question.answers.new
    end

     def answer_params
      params.require(:answer).permit(:id, :body)
    end

    def set_language_and_question
      @language = Language.find(params[:language_id])
      @question = Question.find(params[:question_id])
    end
end
