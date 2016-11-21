require './grid'

class Die
  #hashtable to store throws
  @throws

  def initialize(sides)
    #initializes sides
    @sides = sides
  end

  def get_throws
    @throws
  end

  def roll
    #gets random side
    throw = @sides.sample
    @throws ||= Hash.new
    #checks if throw exists in hashtable
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
