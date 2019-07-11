class Shield < ApplicationRecord
  has_many :fighters

  validates :armor, numericality: {greater_than: 0}

  def name_armor
    [name, armor].join(" : ")
  end

end
