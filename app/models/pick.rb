class Pick < ApplicationRecord
  validates_presence_of :user, :matchup, :choice
  validates :choice, inclusion: { in: ["home", "away"]}
  validates_uniqueness_of :user, scope: :matchup

  belongs_to :user
  belongs_to :matchup


  def status
    if self.closed?
      "Closed"
    else
      "Open until gametime"
    end
  end

  def closed?
    if self.matchup.closing_time < Time.now
      true
    else
      false
    end
  end

  def result
    "Pending result"
  end

  def pick_logo
    if self.choice == "away"
      self.matchup.away_logo_element
    else
      self.matchup.home_logo_element
    end
  end

end
