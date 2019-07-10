class HeroForm < Reform::Form
  property :name
  property :health
  property :attack
  property :speed
  property :dodge_rate
  property :critical_rate
  property :avatar_file_name
  property :avatar_content_type
  property :avatar_file_size
  property :avatar_updated_at
  property :power
  property :rank
end
