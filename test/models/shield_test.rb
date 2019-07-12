require 'test_helper'

class ShieldTest < ActiveSupport::TestCase

  let(:model) { described_class.new }

  it "should has many fighters" do
    t = model.reflect_on_association(:fighters)
    expect(t.macro).to eq(:has_many)
  end
end
