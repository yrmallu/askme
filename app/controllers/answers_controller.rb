class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to question_path(@question.id)
    else
      render 'questions/show'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    questions_path if @answer.destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
