class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @picks = @user.picks.all 
  end

  def index
    @users = User.all
  end

end
