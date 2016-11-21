require './skippy'
require './zigzagaroo'
require './die'
require './grid'
require './point'

#kangaroos instantiations
skippy = Skippy.new
zigzagaroo = Zigzagaroo.new


#part I
#execution kangaroo hopping
def execution_kangaroo (kangaroo_type, point, print_hops)
  #instantiate new die with possible directions
  die_skippy = Die.new(kangaroo_type.get_directions)
  #hop for received kangaroo argument
  throws, hops = kangaroo_type.hop(die_skippy, point, print_hops)
  puts 'finished in ' + hops.to_s + ' hops!'
  puts
  puts 'Die statistics:'
  puts 'Total #throws: ' + throws.to_s
  #print hashtable with throws
  die_skippy.get_throws.sort{|a,b| a[1]<=>b[1]}.each { |elem|
    print elem[0].to_s + ': ' + ((elem[1].to_f/throws)*100).ceil.to_s + '% '
  }
  puts
end

#part II
#execution compare kangaroo with zigzagaroo.rb
def execution_comparison (number_of_runs, skippy, zigzagaroo, point, print_hops)
  total_skippy_hops = 0
  total_zigzagaroo_hops = 0
  index = 1
  #run hops multiple times
  number_of_runs.times do
    point.set_point(0,0)
    #instantiate new die with possible directions
    die_skippy = Die.new(skippy.get_directions)
    #hop for regular kangaroo
    throws, skippy_hops = skippy.hop(die_skippy, point, print_hops)
    total_skippy_hops += skippy_hops
    #instantiate new die with possible directions
    die_zigzagaroo = Die.new(zigzagaroo.get_directions)
    point.set_point(0,0)
    #hop for zigzagaroo
    throws, zigzagaroo_hops = zigzagaroo.hop(die_zigzagaroo, point, print_hops)
    total_zigzagaroo_hops += zigzagaroo_hops
    puts 'Run ' + index.to_s + ': Kangaroo ' + skippy_hops.to_s + ' hops, Zigzagaroo ' + zigzagaroo_hops.to_s + ' hops'
    index += 1
  end
  puts 'On average Kangaroo took ' + (total_skippy_hops.to_f/number_of_runs).ceil.to_s + ' hops, Zigzagaroo took ' + (total_zigzagaroo_hops.to_f/number_of_runs).ceil.to_s + ' hops'
end


#I/O for end user
#inputs for part I
puts 'Enter dimension of the Grid for Part I (>=1):'
point = Point.new(0, 0, Integer(gets.chomp))
execution_kangaroo(skippy, point, true)

#inputs for part II
puts 'Enter dimension of the Grid for Part II (>=1):'
point = Point.new(0, 0, Integer(gets.chomp))
puts 'Enter number of runs for Part II (>=1):'
execution_comparison(Integer(gets.chomp), skippy, zigzagaroo, point, false)
