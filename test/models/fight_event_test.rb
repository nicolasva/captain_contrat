require 'test_helper'

class FightEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  let(:model) { described_class.new }

  it "should belong to fight" do
    t = model.reflect_on_association(:fight)
    expect(t.macro).to eq(:belongs_to)
  end
end

