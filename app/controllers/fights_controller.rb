class FightsController < ApplicationController
  before_action :set_fight, only: [:show, :edit, :update, :destroy]

  expose(:events) do
    fight.fight_events.order(created_at: :asc)
  end

  expose(:rank) do
    params[:rank]
  end

  expose(:fight) do
    params[:id] ? Fight.includes(winner: [:hero, :weapon, :shield], loser: [:hero, :weapon, :shield]).find(params[:id])  : Fight.new
  end

  expose(:weapons) do
    Weapon.all
  end

  expose(:shields) do
    Shield.all
  end

  expose(:heroes) do
    Hero.all
  end

  def show
  end

  def new
  end


  # POST /fights
  # POST /fights.json
  def create
    if params[:one][:hero_id] == params[:two][:hero_id]
      flash[:alert] = "Impossible de faire combattre un héro avec lui-même..."
      redirect_to new_rank_fight_path(Hero.find(params[:one][:hero_id]).rank)
    else
      fight = FightService.new(fighter_params(:one), fighter_params(:two)).call

      redirect_to fight_path(fight)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fight
      @fight = Fight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fighter_params(key)
      params.require(key).permit(:hero_id, :weapon_id, :shield_id)
    end
end
