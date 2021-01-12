class Admin::ChoicesController < ApplicationController
  before_action :find_category_word

  def find_category_word
    @category = Category.find(params[:category_id])
    @word = @category.words.find(params[:word_id])
  end

  def index
  end

  def new
    @choice = Choice.new
  end

  def create
    @choice = @word.choices.build(choice_params)
    if params[:correct_ans] == 'true'
        if @choice.save
          redirect_to admin_category_words_path
        else
          render 'new'
        end
    else 
      redirect_to admin_category_words_path
    end
  end

  def edit

  end

  private
  def choice_params
    params.require(:choice).permit(:correct_ans)
  end
end
