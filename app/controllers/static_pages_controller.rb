class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if signed_in?
    @feed_items = current_user.feed.page(params[:page])
  end

  def help
  end

  def about

  end
end
