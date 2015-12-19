require 'spec_helper'

describe Tile do
  let(:valid_strs) { %w(## @1 @2 @3 @4 $- $1 $2 $3 $4 []) << '  ' }

  it 'is initializable' do
    valid_strs.each { |args| expect(Tile.new(args)).not_to be_nil }
  end
end
