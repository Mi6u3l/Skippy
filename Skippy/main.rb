require './kangaroo'
require './die'
require './point'
require './grid'

#instantions
@skippy = Kangaroo.new(%w(North South East West'))
@zigzagaroo = Kangaroo.new(%w(North South East West North-East North-West South-East South-West']))
@die_skippy = Die.new(@skippy.get_directions)
@die_zigzagaroo = Die.new(@zigzagaroo.get_directions)
@point = Point.new(0,0)
@grid = nil

#part I
#execution kangaroo hopping
def execution_kangaroo
  throws, hops = @skippy.hop(@die_skippy, @point, @grid, true)
  puts 'finished in ' + hops.to_s + ' hops!'
  puts
  puts 'Die statistics:'
  puts 'Total #throws: ' + throws.to_s
  #print hashtable with throws
  @die_skippy.get_throws.sort{|a,b| a[1]<=>b[1]}.each { |elem|
    print elem[0].to_s + ': ' + ((elem[1].to_f/throws)*100).ceil.to_s + '% '
  }
  puts
end

#part II
#execution compare kangaroo with zigzagaroo
def execution_comparison (number_of_runs)
  total_skippy_hops = 0
  total_zigzagaroo_hops = 0
  index = 1
  #run hops multiple times
  number_of_runs.times do
    #hop for regular kangaroo
    @point.set_point(0,0)
    throws, skippy_hops = @skippy.hop(@die_skippy, @point, @grid)
    total_skippy_hops += skippy_hops
    #hop for zigzagaroo
    @point.set_point(0,0)
    throws, zigzagaroo_hops = @zigzagaroo.hop(@die_zigzagaroo, @point, @grid)
    total_zigzagaroo_hops += zigzagaroo_hops
    puts 'Run ' + index.to_s + ': Kangaroo ' + skippy_hops.to_s + ' hops, Zigzagaroo ' + zigzagaroo_hops.to_s + ' hops'
    index += 1
  end
  puts 'On average Kangaroo took ' + (total_skippy_hops.to_f/number_of_runs).ceil.to_s + ' hops, Zigzagaroo took ' + (total_zigzagaroo_hops.to_f/number_of_runs).ceil.to_s + ' hops'
end

#I/O for end user
#inputs for part I
puts 'Enter dimension of the Grid for Part I (>=1):'
@grid = Grid.new(Integer(gets.chomp))
execution_kangaroo

#inputs for part II
puts 'Enter dimension of the Grid for Part II (>=1):'
@grid = Grid.new(Integer(gets.chomp))
puts 'Enter number of runs for Part II (>=1):'
execution_comparison(Integer(gets.chomp))
