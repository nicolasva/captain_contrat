class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.string   :name
      t.integer  :min_damage
      t.integer  :max_damage
      t.timestamps
    end
  end
end
