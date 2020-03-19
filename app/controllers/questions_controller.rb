class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @questions = Question.order('created_at desc')
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to questions_path, flash: { success: 'Question successfully created.' }
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path, flash: { success: 'Question successfully Updated.' }
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, flash: { success: 'Question deleted successfully.' }
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
