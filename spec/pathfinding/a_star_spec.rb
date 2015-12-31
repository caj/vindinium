require 'spec_helper'

describe AStar do
  let(:fake_state) do
    Hashie::Mash.new({
      game: {
        board: {
          tiles: '##########'+
                 '##@1    ##'+
                 '######  ##'+
                 '##$-    ##'+
                 '##########',  # remember, this whole thing ends up being transposed
          size: 5
        }
      }
    })
  end
  let(:board) { Board.new fake_state }
  let(:astar) { AStar.new board }

  it 'correctly finds a path between two points' do
    p = astar.path(board.at(1,1), board.at(3, 1)).map { |move| [move.x, move.y] }
    correct_path = [ [1,1], # start point
                     [1,2], [1,3], # first empty corner
                     [2,3], [3,3], # second empty corner
                     [3,2], [3,1], # goal point
    ]

    expect(p).to eq correct_path
  end
end
