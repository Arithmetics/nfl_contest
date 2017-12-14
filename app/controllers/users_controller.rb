class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    #hide picks until they are
    if @user == current_user
      @picks = @user.picks.all
    else
      @picks = @user.picks.all.select { |pick| pick.closed? == true}
    end
  end

  def index
    @users = User.all.sort_by {|a| [-a.score, -a.lock_points] }
  end

end
