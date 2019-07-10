class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.references :winner, index: true
      t.references :loser, index: true
      t.timestamps
    end
  end
end
