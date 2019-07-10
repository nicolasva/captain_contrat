class FightEvent < ApplicationRecord
  belongs_to :fight

  enum attack_type: ["normal", "critical"]
  enum defend_type: ["receive", "dodge"]

end
