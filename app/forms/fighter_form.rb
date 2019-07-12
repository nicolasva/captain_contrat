class FighterForm < Reform::Form
  property :hero_id, validates: {presence: true}
  property :weapon_id, validates: {presence: true}
  property :shield_id, validates: {presence: true}
end
