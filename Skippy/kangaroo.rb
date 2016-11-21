class Kangaroo

  def initialize(directions)
    #initializes directions
    @directions = directions
  end

  def get_directions
    @directions
  end

  #hop method - gets instances of Die and Point classes.
  def hop(die, point, print_hops=false)
    grid_size = point.get_gridsize
    x, y = point.get_currentpoint
    throws = 0
    hops = 0

    while x != grid_size-1 || y != grid_size-1
      temp_x, temp_y = point.next_point(die.roll)
      #check if is a valid move
      if point.can_move(temp_x,temp_y)
        #sets new point in grid for the hop
        point.set_point(temp_x,temp_y)
        x, y = point.get_currentpoint
        hops+=1
        if print_hops
          puts 'Hopped to: (' + x.to_s + ' , ' + y.to_s + ')'
        end
      else
        if print_hops
          puts 'Oops, hit the boundary: (' + temp_x.to_s + ' , ' + temp_y.to_s + ')'
        end
      end
      throws+=1
    end
    return throws, hops
  end

end
