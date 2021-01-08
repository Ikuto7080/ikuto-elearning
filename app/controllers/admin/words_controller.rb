class Admin::WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def show

  end

  def new
    @word = Word.new
  end

  def edit
  end
  
end
