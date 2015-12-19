require 'spec_helper'

describe Board do
  let(:state) { EX_STATE.dup }

  it 'is initializable' do
    expect(Board.new(state)).not_to be_nil
  end
end
