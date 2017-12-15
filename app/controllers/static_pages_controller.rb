class StaticPagesController < ApplicationController

  before_action :admin_user, only: [:admin]
  helper_method :sort_column, :sort_direction


  def home
    @matchups = Matchup.open?.sort{ |x| x.closing_time }
  end


  def rules

  end


  def admin
    @users = User.all
    @matchups = Matchup.all
    @picks = Pick.order("#{sort_column} #{sort_direction}")
  end

  def history
    @histories = History.all
  end

  private ##################################################3

  def admin_user
    redirect_to(root_url) unless current_user.admin
  end


  def sortable_columns
    ["user_id", "lock", "choice", "result" ]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "user_id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
