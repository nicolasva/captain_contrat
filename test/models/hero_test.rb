require 'test_helper'

class HeroTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  let(:model) { described_class.new }


  it "should has many fighters" do
    t = model.reflect_on_association(:fighters)
    expect(t.macro).to eq(:has_many)
  end

  it "should has many wins" do
    t = model.reflect_on_association(:wins)
    expect(t.macro).to eq(:has_many)
  end


  it "should has many losses" do
    t = model.reflect_on_association(:losses)
    expect(t.macro).to eq(:has_many)
  end
end
