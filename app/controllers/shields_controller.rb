class ShieldsController < ApplicationController
  before_action :set_shield, only: [:show, :edit, :update, :destroy]

  # GET /shields
  # GET /shields.json
  def index
    @shields = Shield.all
  end

  # GET /shields/1
  # GET /shields/1.json
  def show
  end

  # GET /shields/new
  def new
    @shield = Shield.new
  end

  # GET /shields/1/edit
  def edit
  end

  # POST /shields
  # POST /shields.json
  def create
    @shield = Shield.new(shield_params)

    respond_to do |format|
      if @shield.save
        format.html { redirect_to @shield, notice: 'Shield was successfully created.' }
        format.json { render :show, status: :created, location: @shield }
      else
        format.html { render :new }
        format.json { render json: @shield.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shields/1
  # PATCH/PUT /shields/1.json
  def update
    respond_to do |format|
      if @shield.update(shield_params)
        format.html { redirect_to @shield, notice: 'Shield was successfully updated.' }
        format.json { render :show, status: :ok, location: @shield }
      else
        format.html { render :edit }
        format.json { render json: @shield.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shields/1
  # DELETE /shields/1.json
  def destroy
    @shield.destroy
    respond_to do |format|
      format.html { redirect_to shields_url, notice: 'Shield was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shield
      @shield = Shield.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shield_params
      params.fetch(:shield, {})
    end
end
