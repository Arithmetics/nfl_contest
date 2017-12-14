class PicksController < ApplicationController
  before_action :check_if_matchup_closed, :enough_locks?,  only: :create
  before_action :correct_user, only: :destroy
  before_action :check_if_pick_closed, only: :destroy





  def create
    if @pick.save
      flash[:success] = "Pick made!"
      respond_to do |format|
        format.html {redirect_to root_url}
        format.json { head :no_content }
        format.js { render layout: false }
      end
    else
      flash.now[:danger] = "Problem with that pick"
      redirect_to root_url
    end
  end

  def destroy
    @pick.destroy
    regain_lock
    flash[:success] = "Pick deleted"
    respond_to do |format|
      format.html {redirect_to current_user}
      format.json { head :no_content }
      format.js { render layout: false }
    end
  end

  def index
    @picks = Pick.all
  end


  private ###################################

  def correct_user
    @pick = current_user.picks.find_by(id: params[:id])
    redirect_to root_url if @pick.nil?
  end

  def check_if_pick_closed
    if @pick.closed?
      flash[:danger] = "The game has started, cannot delete pick!"
      redirect_to request.referrer || root_url
    end
  end

  def check_if_matchup_closed
    @pick = current_user.picks.build(picks_params)
    if @pick.matchup.closed?
      flash[:danger] = "The game has started, cannot make the pick!"
      redirect_to root_url
      return nil
    end
  end

  def regain_lock
    if @pick.lock
      points = ((current_user.lock_points) + 1)
      current_user.update_attribute(:lock_points, points)
    end
  end

  def enough_locks?
    if @pick
      if @pick.lock == true
        unless current_user.lock_points > 0
          flash[:danger] = "You are out of locks!"
          redirect_to root_url
        else
          points = ((current_user.lock_points) - 1)
          current_user.update_attribute(:lock_points, points)
        end
      end
    end
  end

  def picks_params
    params.require(:pick).permit(:user, :matchup_id, :lock, :choice)
  end
end
