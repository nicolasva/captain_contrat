class HeroForm < Reform::Form
  property :name, validates: {presence: true}
  property :health, validates: {presence: true}
  property :attack, validates: {presence: true}
  property :speed, validates: {presence: true}
  property :dodge_rate, validates: {presence: true}
  property :critical_rate, validates: {presence: true}
  property :avatar_file_name
  property :avatar_content_type
  property :avatar_file_size
  property :avatar_updated_at
  property :power
  property :rank
end
