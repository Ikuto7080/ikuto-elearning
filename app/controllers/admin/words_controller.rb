class Admin::WordsController < ApplicationController
  before_action :find_category
  def find_category
    @category = Category.find(params[:category_id])
  end

  def index
      @words = @category.words
  end

 

  def new
    @word = @category.words.build
    3.times do
      @word.choices.build
    end
  end

  # def create
  #   @word = @category.words.build(word_params)
  #   if choices_attributes[:correct_ans] == 'true'
  #     choices_attributes[:correct_ans] = choices_attributes[:content] 
  #     if @word.save!
  #     flash[:success] = "Word created!"
  #     redirect_to admin_category_words_path
  #     else
  #       render 'new'
  #     end
  #   else 
  #     if @word.save!
  #       flash[:success] = "Word created!"
  #       redirect_to admin_category_words_path
  #     else
  #       render 'new'
  #     end
  #   end
  # end


  def create
    @cword = @category.words.build(word_params)
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
    @word = @category.words.find_by(params[:id])
  end

  def update
    @word = @category.words.find(params[:id])
    if @word.update(word_params)
      redirect_to admin_category_words_path
    else
      render 'edit'
    end
  end


  def destroy
    @word = @category.words.find(params[:id])  
    @word.destroy

    redirect_to admin_category_word_path(@category, @word)
  end

  private
  def word_params
   params.require(:word).permit(:name, choices_attributes: [:content, :correct_ans])
  end


end
