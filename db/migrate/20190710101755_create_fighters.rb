class CreateFighters < ActiveRecord::Migration[5.2]
  def change
    create_table :fighters do |t|
      t.references  :heros, index: true
      t.references  :weapons, index: true
      t.references  :shields, index: true
      t.text     :hero_attributes
      t.timestamps
    end
  end
end
