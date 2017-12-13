class Matchup < ApplicationRecord
  validates_presence_of :home_team,
                        :away_team,
                        :home_line,
                        :away_line,
                        :home_detail,
                        :away_detail,
                        :home_picture,
                        :away_picture
  has_many :picks, dependent: :destroy
  has_many :users, through: :picks

  def self.open?
    self.all.select {|matchup| matchup.closed? == false }
  end

  def closed?
    if self.closing_time < Time.now
      true
    else
      false
    end
  end

  def home_team_class
    "#{self.home_team.gsub(" ","").downcase}"
  end

  def away_team_class
    "#{self.away_team.gsub(" ","").downcase}"
  end

  def home_line_style
    if home_line > -0.5
      if home_line.to_int == home_line
        "+#{home_line.round}"
      else
      "+#{home_line}"
      end
    else
      if home_line.to_int == home_line
        "#{home_line.round}"
      else
      "#{home_line}"
      end
    end
  end

  def away_line_style
    if away_line > -0.5
      if away_line.to_int == away_line
        "+#{away_line.round}"
      else
      "+#{away_line}"
      end
    else
      if away_line.to_int == away_line
        "#{away_line.round}"
      else
      "#{away_line}"
      end
    end
  end

  def pacific_time_display
    self.closing_time.in_time_zone("Tijuana").strftime("%A %m/%d/%Y %I:%M %p")
  end

  def home_logo_element
    "#{self.home_team.downcase.gsub(" ", "-")}-logo-vector.png"
  end

  def away_logo_element
    "#{self.away_team.downcase.gsub(" ", "-")}-logo-vector.png"
  end


end
