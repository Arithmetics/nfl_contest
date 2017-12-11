class Pick < ApplicationRecord
  validates_presence_of :user, :matchup, :choice
  validates :choice, inclusion: { in: ["home", "away"]}
  validates_uniqueness_of :user, scope: :matchup 

  belongs_to :user
  belongs_to :matchup


  def status
    "Open"
  end

end
