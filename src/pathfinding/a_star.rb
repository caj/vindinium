class AStar
  def initialize board
    @board = board
  end

  def path start, goal
    frontier = PQueue.new([]) { |a, b| b[1] <=> a[1] }
    frontier.push [start, 0]
    came_from = {}
    cost_so_far = {}
    came_from[start] = nil
    cost_so_far[start] = 0

    while !frontier.empty?
      cur = frontier.pop[0]
      break if cur == goal
      cur.nabes.each do |nabe|
        new_cost = cost_so_far[cur] + nabe.cost
        if !cost_so_far.has_key?(nabe) || new_cost < cost_so_far[nabe]
          cost_so_far[nabe] = new_cost
          priority = new_cost + heuristic(nabe, goal)
          frontier << [nabe, priority]
          came_from[nabe] = cur
        end
      end
    end

    if cur == goal
      p = [cur]
      p.push(came_from[p.last]) while p.last != start
      p.reverse
    end
  end

  def heuristic a, b
    (a.x - b.x).abs + (a.y - b.y).abs
  end
end
