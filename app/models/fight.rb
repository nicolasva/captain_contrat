class Fight < ApplicationRecord
  belongs_to :winner, class_name: "Fighter", foreign_key: "winner_id"
  belongs_to :loser, class_name: "Fighter", foreign_key: "loser_id"

  has_many :fight_events
  
  scope :find_fight,  ->(id) {includes(winner: [:hero, :weapon, :shield], loser: [:hero, :weapon, :shield]).find(id) }
end
