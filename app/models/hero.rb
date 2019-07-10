class Hero < ApplicationRecord

  has_many :fighters
  has_many :wins, through: :fighters
  has_many :losses, through: :fighters
end
