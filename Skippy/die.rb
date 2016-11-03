class Die
  #hashtable to store throws
  @throws

  def initialize(directions)
    #initializes directions
    @directions = directions
  end

  def get_throws
    @throws
  end

  def roll
    #gets random direction
    throw = @directions.sample
    @throws ||= Hash.new
    #checks if throw exists on hashtable
    if @throws.has_key? throw
      #increment
      @throws[throw] = Integer(@throws[throw]) + 1
    else
      #add new
      @throws[throw] = 1
    end
    #returns randomly selected throw
    throw
  end

end
