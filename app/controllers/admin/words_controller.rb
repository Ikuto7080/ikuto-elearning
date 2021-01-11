class Admin::WordsController < ApplicationController
  before_action :find_category, only: [:index, :show, :create, :edit, :update, :destroy]
  def find_category
    @category = Category.find_by(params[:category_id])
  end
  def index
    @words = Word.paginate(page: params[:page], per_page: 10)
  end

  def show
    @words = @category.words.paginate(page: params[:page], per_page: 5)
  end

  def new
    @word = Word.new
  end

  def create
    @word = @category.words.build(word_params)
    if @word.save
      flash[:success] = "Word created!"
      redirect_to admin_category_word_url(@category, @word)
    else
      render 'new'
    end
  end

  def edit
    @word = @category.words.find_by(params[:id])
  end

  def update
    @word = @category.words.find(params[:id])
    if @word.update(word_params)
      redirect_to admin_category_word_url(@word)
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
   params.require(:word).permit(:word, :category_id)
  end


end
