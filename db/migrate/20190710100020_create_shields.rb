class CreateShields < ActiveRecord::Migration[5.2]
  def change
    create_table :shields do |t|
      t.string :name
      t.integer :armor
      t.timestamps
    end
  end
end
