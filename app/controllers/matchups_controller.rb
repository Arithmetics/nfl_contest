class MatchupsController < ApplicationController

  def new
    @matchup = Matchup.new
  end

  def create
    @matchup = Matchup.new(matchup_params)
    if @matchup.save
      flash[:success] = "Matchup Created"
      redirect_to root_url
    else
      flash.now[:danger] = "Issue with form"
      render 'new'
    end
  end





  private #############################3

  def matchup_params
    params.require(:matchup).permit(:home_team,:away_team,:home_line,:away_line,
                                    :home_detail,:away_detail,:home_picture,:away_picture)
  end
end
