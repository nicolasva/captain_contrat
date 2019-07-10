class FightEvent < ApplicationRecord
  belongs_to :fight

  enum attack_type: ["normal", "critical"]
  enum defend_type: ["receive", "dodge"]

  def to_str
    event = "#{attacker_name} attaque pour #{attack_damage} dégâts."
    event += " C'est un coup critique !" if attack_type == 'critical'

    event += " #{defender_name} subit l'attaque" if defend_type == 'receive'
    event += " #{defender_name} évite l'attaque" if defend_type == 'dodge'

    event += " et a #{defender_health} points de vie !"
  end
end
