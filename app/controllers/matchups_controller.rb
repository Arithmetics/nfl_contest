class MatchupsController < ApplicationController

  before_action :admin_user, only: [:new, :edit, :update, :create, :destroy]

  def new
    @teams = Matchup.teams
    @matchup = Matchup.new
  end

  def edit
    @teams = Matchup.teams 
    @matchup = Matchup.find(params[:id])
  end

  def create
    @matchup = Matchup.new(matchup_params)
    if @matchup.save
      flash[:success] = "Matchup Created"
      redirect_to request.referer || root_url
    else
      flash.now[:danger] = "Issue with form"
      render 'new'
    end
  end

  def update
    @matchup = Matchup.find(params[:id])
    if @matchup.update_attributes(matchup_params)
      flash[:success] = "Matchup edited"
      redirect_to admin_path
    else
      flash.now[:danger] = "Issue with form"
      render 'edit'
    end
  end

  def destroy
    Matchup.find(params[:id]).destroy
    flash[:success] = "Matchup deleted"
    redirect_to request.referrer || root_url
  end





  private #############################

  def matchup_params
    params.require(:matchup).permit(:title,:home_team,:away_team,:home_line,:away_line,
                                    :home_detail,:away_detail,:home_picture,
                                    :away_picture,:closing_time,:result)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin
  end

end
