require_relative '../spec_helper'

describe BaseBehavior do
  subject { BaseBehavior }

  describe '#move' do
    it 'is always "Stay"' do
      expect(subject.move EX_STATE).to eq "Stay"
    end
  end

  describe '#should_act?' do
    it 'is always true' do
      expect(subject.should_act? EX_STATE).to be true
    end
  end
end
