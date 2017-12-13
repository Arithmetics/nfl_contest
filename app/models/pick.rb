class Pick < ApplicationRecord
  validates_presence_of :user, :matchup, :choice
  validates :choice, inclusion: { in: ["home", "away"]}
  validates_uniqueness_of :user, scope: :matchup

  belongs_to :user
  belongs_to :matchup

  def win?
    if self.matchup.result == self.choice
      true
    else
      false
    end
  end

  def loss?
    if self.matchup.result != "pending" && self.matchup.result != self.choice
      true
    else
      false
    end
  end

  def status
    if self.closed?
      if self.win?
        "Finalized"
      elsif self.loss?
        "Finalized"
      else
        "Closed"
      end
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
    if self.win?
      "Correct Pick!"
    elsif self.loss?
      "Incorrect Pick!"
    else
      "Result Pending"
    end
  end

  def pick_logo
    if self.choice == "away"
      self.matchup.away_logo_element
    else
      self.matchup.home_logo_element
    end
  end

end
