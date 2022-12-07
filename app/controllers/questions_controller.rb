class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit]
  def create 
    question = Question.create(question_params)

    redirect_to question_path(question), notice: "Вопрос успешно создан!"
  end

  def update
    @question.update(question_params)

    redirect_to question_path(@question), notice: "Вопрос успешно изменён!"
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: "Вопрос успешно удалён!"
  end

  def show
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def hide
    @question = Question.find(params[:question_id])
    @question.update(hidden: true)

    redirect_to questions_path, notice: "Вопрос успешно скрыт!"
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
