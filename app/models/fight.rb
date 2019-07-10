class Fight < ApplicationRecord
  belongs_to :winner, class_name: "Fighter", foreign_key: "winner_id"
  belongs_to :loser, class_name: "Fighter", foreign_key: "loser_id"
end
