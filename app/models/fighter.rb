class Fighter < ApplicationRecord
  belongs_to :hero
  belongs_to :weapon
  belongs_to :shield

  has_one :win, class_name: "Fight", foreign_key: "winner_id"
  has_one :loss, class_name: "Fight", foreign_key: "loser_id"

  delegate :name, :health, :attack, :speed, :dodge_rate, :critical_rate, :power, :rank, to: :hero


end
