class StaticPagesController < ApplicationController


  def home
    @matchups = Matchup.all
  end

end
