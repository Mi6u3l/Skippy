require './kangaroo'

class Zigzagaroo < Kangaroo

  def initialize()
    super(%w(North South East West North-East North-West South-East South-West']))
  end

end