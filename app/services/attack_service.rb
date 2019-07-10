class AttackService
  def initialize(fighter_one, fighter_two)
    @fighter_one = fighter_one
    @fighter_two = fighter_two
  end

  attr_reader :fighter_one, :fighter_two


  def detect_order_of_attacks
    if fighter_one.speed >= fighter_two.speed
      [fighter_one, fighter_two]
    else
      [fighter_two, fighter_one]
    end
  end


  def attack_against(fighter, enemy_fighter)
    damage, attack_type = determine_damage(fighter)
    health, defend_type = determine_defense(fighter, damage)

    FightEvent.create(attacker_name: fighter.name,
                      attack_type: attack_type,
                      attack_damage: damage,
                      defender_name: enemy_fighter.name,
                      defend_type: defend_type,
                      defender_health: health)
  end


  private
  def determine_damage(fighter)
    if Random.rand(100) < fighter.critical_rate
      [fighter_attack(fighter) * 2, FightEvent.attack_types['critical']]
    else
      [fighter_attack(fighter), FightEvent.attack_types['normal']]
    end
  end

  def determine_defense(fighter, damage)
    damage = difference_or_zero_if_negative(damage, fighter_defense(fighter))

    if Random.rand(100) < fighter.dodge_rate
      [fighter.health, FightEvent.defend_types['dodge']]
    else
      fighter.hero.health = difference_or_zero_if_negative(fighter.health, damage)
      [fighter.health, FightEvent.defend_types['receive']]
    end
  end

  def difference_or_zero_if_negative(amount, substract)
    amount > substract ? amount - substract : 0
  end

  def fighter_attack(fighter)
    fighter.attack + (fighter.weapon&.bonus_attack_provided).to_i
  end

  def fighter_defense(fighter)
    (fighter.shield&.armor).to_i
  end

end
