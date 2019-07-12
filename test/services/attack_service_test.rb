require 'test_helper'

class AttackServiceTest < ActionDispatch::IntegrationTest
  setup do
    @hero = heros(:one)
    @hero2 = heros(:two)
    @weapon = weapons(:one)
    @weapon2 = weapons(:two)

  end
  
  let(:fighter_one) { Fighter.create(hero: @hero) }
  let(:fighter_two) { Fighter.create(hero: @hero2) }

  context 'order attacks' do
    it 'fighter_one is more speed than fighter_two' do

    end
  end
end
