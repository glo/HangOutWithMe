class UsersController < ApplicationController
  
  def index
      @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @events = @user.events.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
end
