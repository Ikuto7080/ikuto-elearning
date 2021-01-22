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
    if @lesson.save
      unless params[:page].empty?
        redirect_to new_category_lesson_answer_url(@word.page: params[:page])
      else
        result = 0
        @cateogyry.words.each do |answer|
          if answer.choice.correct?
            result += 1
          end
          @lesson.update_attributes(:result =>result, :is_completed => true)
          @lesson.create_activity(user_id: current_user.id)
      end
      redirect_to category_lesson(@category, @lesson)
    end
  end

  private
  def answer_params
    params.permit(:word_id, :choice_id, :lesson_id)
  end
end
