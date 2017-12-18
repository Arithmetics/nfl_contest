class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    #hide picks until they are
    if @user == current_user
      @picks = @user.picks.all.reverse
    else
      @picks = @user.picks.all.select { |pick| pick.closed? == true}.reverse
    end
  end

  def index
    @users = User.all.sort_by {|a| [-a.score, -a.lock_points] }
    @matchups = Matchup.all.order(closing_time: :desc)
  end

end
