class AnswersController < ApplicationController
  def index
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    @choices = choices.all
  end


end
