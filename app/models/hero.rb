class Hero < ApplicationRecord

  has_many :fighters
  has_many :wins, through: :fighters
  has_many :losses, through: :fighters

  before_save :compute_power_and_rank

  mount_uploader :avatar_file_name, AvatarUploader

  def compute_power_and_rank
    self.power = self.health + self.attack
    self.power += self.health * (self.dodge_rate / 100.0)
    self.power += self.attack * (self.critical_rate / 100.0)

    self.rank = self.power.to_i.to_s.length
  end
end
