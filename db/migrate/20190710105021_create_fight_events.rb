class CreateFightEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :fight_events do |t|
      t.references  :fights, index: true
      t.string      :attacker_name
      t.integer     :attack_type
      t.integer     :attack_damage
      t.string      :defender_name
      t.integer     :defend_type
      t.integer     :defender_health
      t.timestamps
    end
  end
end
