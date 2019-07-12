class HeroForm < Reform::Form
  property  :name
  validates :name, presence: true
  property  :health
  validates :health, presence: true
  property  :attack
  validates :attack, presence: true
  property  :speed
  validates :speed, presence: true
  property  :dodge_rate
  validates :dodge_rate, presence: true
  property  :critical_rate
  validates :critical_rate, presence: true
  property :avatar_file_name
  property :avatar_content_type
  property :avatar_file_size
  property :avatar_updated_at
  property :power
  property :rank
end
