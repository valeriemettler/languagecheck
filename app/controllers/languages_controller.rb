class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :edit, :update, :destroy]

  def index
    @languages = Language.all
    authorize @languages
  end

  def show
    @language = Language.find(params[:id])
    @questions = @language.questions
    # authorize @language
  end

  def new
    @language = Language.new
    authorize @language
  end

  def edit
    @language = Language.find(params[:id])
    authorize @language
  end

  def create
     @language = Language.new(params.require(:language).permit(:name, :public))
     authorize @language
     if @language.save
       redirect_to @language, notice: "Language was saved successfully."

     else
       flash[:error] = "Error creating language. Please try again."
       render :new
     end
  end

  def update
     @language = Language.find(params[:id])
     authorize @language
     
     if @language.update_attributes(params.require(:language).permit(:name, :public))
       redirect_to @language
     else
       flash[:error] = "Error saving language. Please try again."
       render :edit
     end
  end

  def destroy
    @language.destroy
    respond_to do |format|
      format.html { redirect_to languages_url }
      format.json { head :no_content }
    end
  end

  private

    def set_language
      @language = Language.find(params[:id])
    end

    def language_params
      params.require(:language).permit(:name)
    end
end
