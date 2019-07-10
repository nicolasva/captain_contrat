class Weapon < ApplicationRecord

  validates :min_damage, :max_damage, numericality: {greater_than: 0}
  validate :max_damage_superior_to_min_damage

  def mean_damage
    (max_damage + min_damage) / 2
  end

  def bonus_attack_provided
    min_damage + Random.rand(difference_min_max + 1)
  end

  def to_str
    "#{name} : #{min_damage} – #{max_damage}"
  end

  private

    def max_damage_superior_to_min_damage
      if max_damage < min_damage
        errors.add(:max_damage, "can't be inferior to min_damage: #{min_damage}")
      end
    end

    def difference_min_max
      max_damage - min_damage
    end
end
