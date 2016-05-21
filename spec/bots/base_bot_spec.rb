require_relative '../spec_helper'

describe BaseBot do
  subject { BaseBot.new }

  describe '#move' do
    it 'calls on its first behavior which should act' do
      expect(BaseBehavior).to receive :move
      subject.move
    end
  end

  describe '#behaviors' do
    it 'contains only the BaseBehavior' do
      expect(subject.behaviors).to eq [BaseBehavior]
    end
  end
end
