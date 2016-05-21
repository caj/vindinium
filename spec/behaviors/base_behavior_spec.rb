require_relative '../spec_helper'

describe BaseBehavior do
  subject { BaseBehavior.new EX_STATE }

  describe '#move' do
    it 'is always "Stay"' do
      expect(subject.move).to eq "Stay"
    end
  end

  describe '#should_act?' do
    it 'is always true' do
      expect(subject.should_act?).to be true
    end
  end
end
