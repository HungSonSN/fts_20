class Admin::QuestionsController < ApplicationController
  def new
    @question = Question.new
    4.times {@question.options.build}
  end

  def show
    @question = Question.find params[:id]
    @options = @question.options
  end

  def index
  end

  def edit
    @question = Question.find params[:id]
  end

  def update
    @question = Question.find params[:id]
    if @question.update_attributes question_params
      redirect_to admin_question_path @question
    else
      render 'edit'
    end
  end

  def create
    @question = Question.new question_params
    if @question.save
      redirect_to admin_questions_path
    else
      render 'new'
    end
  end

  def destroy
    @question = Question.find params[:id]
    @question.destroy
    flash[:success] = "Question deleted"
    redirect_to admin_questions_path
  end

  private
  def question_params
    params.require(:question).permit :course_id,
      :content, options_attributes: [:id, :content, :correct]
  end
end