class StaticPagesController < ApplicationController
  def home
    if !current_user.nil?
      @event = current_user.events.build 
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
