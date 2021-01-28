class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = current_user
      @activities = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def contact
  end
end
