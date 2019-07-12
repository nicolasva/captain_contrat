class FighterForm < Reform::Form
  property  :hero_id
  validates :hero_id,   presence: true
  property  :weapon_id
  validates :weapon_id, presence: true
  property  :shield_id
  validates :shield_id, presence: true
end
