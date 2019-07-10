class CreateFighters < ActiveRecord::Migration[5.2]
  def change
    create_table :fighters do |t|
      t.references  :hero, index: true
      t.references  :weapon, index: true
      t.references  :shield, index: true
      t.text     :hero_attributes
      t.timestamps
    end
  end
end
