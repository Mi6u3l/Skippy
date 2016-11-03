class Grid

  def initialize(size)
    @size = size
  end

  def get_gridsize
    @size
  end

  #validates if next point move is possible, making sure there are no hops to outside the grid
  def can_move(x, y)
    if x < 0 or y < 0 or x > @size - 1 or y > @size - 1
       return false
    end
     true
  end

end
