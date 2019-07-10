class FightService
  def initialize(hero_one, hero_two)
    @hero_one = hero_one
    @hero_two = hero_two
    @fighter_one = Fighter.create(@hero_one)
    @fighter_two = Fighter.create(@hero_two)
    @fight = Fight.new
  end

  attr_reader :hero_one, :hero_two, :fighter_one, :fighter_two

  def call
      return fight_one_two
  end

  private
  def fight_one_two
    winner, loser = generate_fight_events

    @fight.winner = winner
    @fight.loser = loser
    @fight.save

    return @fight
  end


  def generate_fight_events
    first_fighter, second_fighter = detect_order_of_attacks

    while first_fighter.health > 0 && second_fighter.health > 0 do
      @fight.fight_events << attack_against(first_fighter, second_fighter)
      @fight.fight_events << attack_against(second_fighter, first_fighter) unless second_fighter.health == 0
    end

    detect_winner_and_loser(first_fighter, second_fighter)
  end

  def detect_order_of_attacks
    if fighter_one.speed >= fighter_two.speed
      [fighter_one, fighter_two]
    else
      [fighter_two, fighter_one]
    end
  end

  def detect_winner_and_loser(first_fighter, second_fighter)
    if first_fighter.health > 0
      [first_fighter, second_fighter]
    else
      [second_fighter, first_fighter]
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
