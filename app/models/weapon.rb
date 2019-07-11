class Weapon < ApplicationRecord

  validates :min_damage, :max_damage, numericality: {greater_than: 0}
  validate :validate_damage

  private
  
  def validate_damage
    if max_damage < min_damage
      errors.add(:max_damage, "can't be inferior to min_damage: #{min_damage}")
    end
  end
end
