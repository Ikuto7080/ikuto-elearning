class Admin::WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def show
    @word = Word.find(params[:id])
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(params.require(:word).permit(:word))
    @word.save

    redirect_to @word
  end

  def edit
  end


end
