class LessonsController < ApplicationController
  before_action :find_category, only: [:new, :create, :show]

  def new
    @user = User.find(params[:user_id])
    @lesson = Lesson.new
  end

  def create
  end

  def show
  end
end
