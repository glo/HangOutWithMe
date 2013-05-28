class EventsController < ApplicationController
    before_filter :signed_in_user, only: [:create, :destroy]
    before_filter :correct_user,   only: :destroy
    
    def create
        this_time = Time.parse(params["hour"] + ":" + params["minute"] + " " + params["meridian"], Time.now)
        @event = current_user.events.build(activity:params["event-activity"], location:params["event-location"], start_time:this_time)
        if @event.save
            flash[:success] = "Event created!"
            redirect_to root_url
        else
            #raise 'hi jack!'
            @feed_items = []
            render 'static_pages/home'
        end
    end
    
    def destroy
        @event.destroy
        redirect_to root_url
    end
    
    private
    
      def signed_in_user
        redirect_to "/auth/facebook", notice: "Please sign in" unless !current_user.nil?
      end
    
      def correct_user
        @event = current_user.events.find_by_id(params[:id])
        redirect_to root_path if @event.nil?
      end
    
end