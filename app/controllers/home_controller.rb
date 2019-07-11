class HomeController < ApplicationController
  before_action :set_hero, only: [:show, :edit, :update, :destroy]

  expose(:heros) do
    Hero.order(rank: :desc, power: :desc).limit(10).group(:rank, :id)
  end

  def index

  end
end
