class KnightPathFinder

  def initialize(starting_point)
    @starting_point = starting_point
    @move_tree = {}
  end

  def build_move_tree
    queue = [@starting_point]
    until queue.empty?
      cur_pos = queue.shift
      new_moves = KnightPathFinder.valid_moves(cur_pos)
    end
  end

  def self.valid_moves(pos)
    moves = []
    moves << [pos[0]+2, pos[1] + 1]
    moves << [pos[0]-2, pos[1] + 1]
    moves << [pos[0]+2, pos[1] - 1]
    moves << [pos[0]-2, pos[1] - 1]
    moves << [pos[0]+1, pos[1] + 2]
    moves << [pos[0]-1, pos[1] + 2]
    moves << [pos[0]+1, pos[1] - 2]
    moves << [pos[0]-1, pos[1] - 2]
    moves.select { |move| in_board?(move) }
  end

  def in_board?(pos)
    pos[0] >= 0 && pos[0] <= 7 && pos[1] >= 0 && pos[1] <= 7
  end


end
