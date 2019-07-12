require 'test_helper'

class FighterTest < ActiveSupport::TestCase

  let(:model) { described_class.new }

  it "should belong to hero" do
    t = model.reflect_on_association(:hero)
    expect(t.macro).to eq(:belongs_to)
  end

  it "should belong to weapon" do
    t = model.reflect_on_association(:weapon)
    expect(t.macro).to eq(:belongs_to)
  end

  it "should belong to shield" do
    t = model.reflect_on_association(:shield)
    expect(t.macro).to eq(:belongs_to)
  end

  it "should has one win" do
    t = model.reflect_on_association(:win)
    expect(t.macro).to eq(:has_one)
  end

  it "should has one loss" do
    t = model.reflect_on_association(:loss)
    expect(t.macro).to eq(:has_one)
  end
end
