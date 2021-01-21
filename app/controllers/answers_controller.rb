class AnswersController < ApplicationController
  before_action :find_category
  def index

  end

  def new
    @words =  @category.words.paginate(page:params[:page], per_page: 1)
    @lesson = Lesson.find(params[:lesson_id])
    @answer = Answer.new
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to category_lesson_url(@category, @lesson)
    end
  end

  private
  def answer_params
    params.permit(:word_id, :choice_id, :lesson_id)
  end
end
