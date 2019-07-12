class HerosController < ApplicationController
  before_action :set_hero, only: [:show, :edit, :update, :destroy]

  expose(:hero) do
    params[:id] ? Hero.find(params[:id]) : Hero.new
  end

  expose(:hero_form) do
    HeroForm.new(hero)
  end


  def show
  end

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if hero_form.validate(params[:hero])
        hero_form.save 
        format.html { redirect_to hero_path(hero_form), notice: 'Hero was successfully created.' }
        format.json { render :show, status: :created, location: hero_form }
      else
        format.html { render :new }
        format.json { render json: hero_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if hero_form.validate(params[:hero])
        hero_form.save
        format.html { redirect_to hero_path(hero_form), notice: 'Hero was successfully updated.' }
        format.json { render :show, status: :ok, location: hero_form}
      else
        format.html { render :edit }
        format.json { render json: hero_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hero.destroy
    respond_to do |format|
      format.html { redirect_to heros_url, notice: 'Hero was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero
      @hero = Hero.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hero_params
      params.fetch(:hero, {})
    end
end
