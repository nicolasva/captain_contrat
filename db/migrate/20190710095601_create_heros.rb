class CreateHeros < ActiveRecord::Migration[5.2]
  def change
    create_table :heros do |t|
      t.string   :name
      t.integer  :health
      t.integer  :attack
      t.integer  :speed,               default: 5
      t.integer  :dodge_rate,          default: 0
      t.integer  :critical_rate,       default: 0
      t.string   :avatar_file_name
      t.string   :avatar_content_type
      t.integer  :avatar_file_size
      t.datetime :avatar_updated_at
      t.datetime :created_at,                      null: false
      t.datetime :updated_at,                      null: false
      t.integer  :power
      t.integer  :rank
      t.timestamps
    end
  end
end
