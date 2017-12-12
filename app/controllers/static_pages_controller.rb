class StaticPagesController < ApplicationController

  before_action :admin_user, only: [:admin]


  def home
    @matchups = Matchup.open?
  end


  def rules

  end


  def admin
    @users = User.all
    @matchups = Matchup.all
    @picks = Pick.all
  end

  private ##################################################3

  def admin_user
    redirect_to(root_url) unless current_user.admin
  end

end
