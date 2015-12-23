require 'spec_helper'

describe Tile do
  it 'is initializable' do
    expect(Tile.new('  ')).not_to be_nil
  end
end
