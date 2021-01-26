class LessonsController < ApplicationController
  before_action :find_category, only: [:new, :create, :show]

  def new
    @user = User.find(params[:user_id])
    @lesson = @category.lessons.build
  end

  def create
    @lesson = Lesson.new(lessons_params)
    if @lesson.save
      redirect_to new_category_lesson_answer_url(@category, @lesson) 
    end
  end


  def show
    @lesson = Lesson.find(params[:id])
    @answers = @lesson.answers
    @category = Category.find(params[:category_id])
    @words = @category.words
  end


  private
  def lessons_params
    params.permit(:category_id).merge(user_id: current_user.id)
  end
end
