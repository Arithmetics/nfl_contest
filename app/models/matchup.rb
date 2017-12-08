class Matchup < ApplicationRecord
  validates_presence_of :home_team,
                        :away_team,
                        :home_line,
                        :away_line,
                        :home_detail,
                        :away_detail,
                        :home_picture,
                        :away_picture

end
