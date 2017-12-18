class GraphsController < ApplicationController

  def graphs
    @matchups = Matchup.all
  end

end
