class LessonsController < ApplicationController
  before_action :find_category, only: [:new, :create, :show]

  def new
    @user = User.find(params[:user_id])
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new
    if @lesson.save
      redirect_to new_category_lesson_answer_path(@category, @lesson)
    else
      redirect_to category_lesson_path(@category, @lesson)
    end
  end

  def show
  end
end
