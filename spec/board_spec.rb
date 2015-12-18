require 'spec_helper'

describe Board do
  it 'is initializable' do
    expect(Board.new).not_to be_nil
  end
end
