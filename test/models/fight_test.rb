require 'test_helper'

class FightTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  let(:model) { described_class.new }

  it "should belong to winner" do
    t = model.reflect_on_association(:winner)
    expect(t.macro).to eq(:belongs_to)
  end


  it "should belong to loser" do
    t = model.reflect_on_association(:loser)
    expect(t.macro).to eq(:belongs_to)
  end


  it "should has many fight_events" do
    t = model.reflect_on_association(:fight_events)
    expect(t.macro).to eq(:has_many)
  end
end
