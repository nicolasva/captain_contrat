class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.references :winners, index: true
      t.references :losers, index: true
      t.timestamps
    end
  end
end
