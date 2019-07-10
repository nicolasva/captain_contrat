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

  # GET /fights
  # GET /fights.json
  def index
    @fights = Fight.all
  end

  # GET /fights/1
  # GET /fights/1.json
  def show
  end

  # GET /fights/new
  def new
  end

  # GET /fights/1/edit
  def edit
  end

  # POST /fights
  # POST /fights.json
  def create
    #@fight = Fight.new(fight_params)

    #respond_to do |format|
    #  if @fight.save
    #    format.html { redirect_to @fight, notice: 'Fight was successfully created.' }
    #    format.json { render :show, status: :created, location: @fight }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @fight.errors, status: :unprocessable_entity }
    #  end
    #end

    if params[:one][:hero_id] == params[:two][:hero_id]
      flash[:alert] = "Impossible de faire combattre un héro avec lui-même..."
      redirect_to new_rank_fight_path(Hero.find(params[:one][:hero_id]).rank)
    else
      fight = FightService.new(fighter_params(:one), fighter_params(:two)).call

      redirect_to fight_path(fight)
    end
  end

  # PATCH/PUT /fights/1
  # PATCH/PUT /fights/1.json
  def update
    respond_to do |format|
      if @fight.update(fight_params)
        format.html { redirect_to @fight, notice: 'Fight was successfully updated.' }
        format.json { render :show, status: :ok, location: @fight }
      else
        format.html { render :edit }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fights/1
  # DELETE /fights/1.json
  def destroy
    @fight.destroy
    respond_to do |format|
      format.html { redirect_to fights_url, notice: 'Fight was successfully destroyed.' }
      format.json { head :no_content }
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
