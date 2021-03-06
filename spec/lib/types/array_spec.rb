# frozen_string_literal: true

describe Sail::Types::Array, type: :lib do
  let(:setting) { Sail::Setting.create!(name: :setting, cast_type: :array, value: "1;2;3") }

  describe "#to_value" do
    subject { described_class.new(setting).to_value }
    it { is_expected.to eq(%w[1 2 3]) }
  end

  describe "#from" do
    subject { described_class.new(setting).from(%w[1 2 3]) }
    it { is_expected.to eq("1;2;3") }
  end
end
