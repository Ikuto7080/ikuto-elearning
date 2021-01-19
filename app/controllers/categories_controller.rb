class CategoriesController < ApplicationController





  def index
    @categories = Category.all
    @category = Category.new
    @lesson = Lesson.new
  end
end
