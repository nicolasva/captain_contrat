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
    winner, loser = fight

    @fight.winner = winner
    @fight.loser = loser
    @fight.save

    return @fight
  end


  def fight
    attack_service = AttackService.new(fighter_one, fighter_two)
    first_fighter, second_fighter = attack_service.order_attacks
    while first_fighter.health > 0 && second_fighter.health > 0 do
      @fight.fight_events << attack_service.attack!(first_fighter, second_fighter)
      @fight.fight_events << attack_service.attack!(second_fighter, first_fighter) unless second_fighter.health == 0
    end

    winner_and_loser?(first_fighter, second_fighter)
  end

  def winner_and_loser?(first_fighter, second_fighter)
    first_fighter.health > 0 ? [first_fighter, second_fighter] : [second_fighter, first_fighter]
  end
end
