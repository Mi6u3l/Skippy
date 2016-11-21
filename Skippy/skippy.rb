require './kangaroo'

class Skippy < Kangaroo

  def initialize()
    super(%w(North South East West'))
  end

end
