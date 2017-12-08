class StaticPagesController < ApplicationController


  def home
    @matchups = Matchup.all
  end

  def rules

  end

end
