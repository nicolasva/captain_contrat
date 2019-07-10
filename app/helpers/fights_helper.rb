module FightsHelper
  def details(event)
    result = "#{event.attacker_name} attaque pour #{event.attack_damage} dégâts."
    result += " C'est un coup critique !" if event.attack_type == 'critical'

    result += " #{event.defender_name} subit l'attaque" if event.defend_type == 'receive'
    result += " #{event.defender_name} évite l'attaque" if event.defend_type == 'dodge'

    result += " et a #{event.defender_health} points de vie !"
    return result
  end
end
