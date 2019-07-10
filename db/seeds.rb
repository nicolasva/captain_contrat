# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
  hero_name = Faker::Name.name

  Hero.create! name: hero_name,
               health: 100 + Random.rand(49999),
               attack: 100 + Random.rand(999),
               speed: Random.rand(10),
               dodge_rate: "30",
               critical_rate: "100"
end

Weapon.create! name: "bow", min_damage: 10, max_damage: 20
Weapon.create! name: "Sward", min_damage: 51, max_damage: 78
Weapon.create! name: "Colt", min_damage: 160, max_damage: 210
Weapon.create! name: "Magnum", min_damage: 341, max_damage: 350
Weapon.create! name: "Cold", min_damage: 10, max_damage: 500
Weapon.create! name: "Ak47", min_damage: 600, max_damage: 600

Shield.create! name: "Shield 1", armor: 10
Shield.create! name: "Shield 2", armor: 100
Shield.create! name: "Shield 3", armor: 300
Shield.create! name: "Shield 4", armor: 500
