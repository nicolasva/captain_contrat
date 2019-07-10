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
    attack_service = AttackService.new(fighter_one, fighter_two)
    first_fighter, second_fighter = attack_service.detect_order_of_attacks
    while first_fighter.health > 0 && second_fighter.health > 0 do
      @fight.fight_events << attack_service.attack_against(first_fighter, second_fighter)
      @fight.fight_events << attack_service.attack_against(second_fighter, first_fighter) unless second_fighter.health == 0
    end

    detect_winner_and_loser(first_fighter, second_fighter)
  end

  def detect_winner_and_loser(first_fighter, second_fighter)
    first_fighter.health > 0 ? [first_fighter, second_fighter] : [second_fighter, first_fighter]
  end
end
