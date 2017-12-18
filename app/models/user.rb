class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: true, presence: true
  validates :full_name, presence: true
  validate :avatar_size
  has_many :picks
  has_many :matchups, through: :picks

  after_update :crop_avatar

  mount_uploader :avatar, AvatarUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def self.top_score
    top = 0
    self.all.each do |user|
      if user.score > top
        top = user.score
      end
    end
    top
  end

  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end

  def picked_matchup?(matchup)
    if self.matchups.find_by_id(matchup.id)
      true
    else
      false
    end
  end

  def unpicked_games
    x = 0
    Matchup.all.each do |matchup|
      if self.picks.find_by(matchup_id: matchup.id)
        x += 0
      else
        if !matchup.closed?
          x += 1
        end
      end
    end
    x
  end

  def score
    score = 0
    self.picks.each do |pick|
      if pick.win?
        if pick.lock
          score += 2
        else
          score += 1
        end
      end
    end
    score
  end

  private #######################################

  def avatar_size
    if avatar.size > 5.megabytes
      errors.add(:avatar, "Needs to be less than 5MB, please resize")
    end
  end
end
