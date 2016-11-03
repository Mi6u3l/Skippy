class Point

  def initialize(x, y)
    @x_axis = x
    @y_axis = y
  end

  def get_currentpoint
    return @x_axis, @y_axis
  end

  def set_point(x, y)
    @x_axis = x
    @y_axis = y
  end

  #generates next point based on received coordinate
  def next_point(new_coordinate)
    new_x = @x_axis
    new_y = @y_axis
    case new_coordinate
    when 'North'
      new_y += 1
    when 'South'
      new_y -= 1
    when 'East'
      new_x += 1
    when 'West'
      new_x -= 1
    when 'North-East'
      new_y += 1
      new_x += 1
    when 'North-West'
      new_y += 1
      new_x -= 1
    when 'South-East'
      new_y -= 1
      new_x += 1
    when 'South-West'
        new_y -= 1
        new_x -= 1
    end
    return new_x, new_y
  end
end
