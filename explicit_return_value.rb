require 'benchmark/ips'

def explict_add(n, m)
  return n + m
end

def explicit(n)
  n.times do |s|
    explict_add(1,2)
    return explict_add(3,4)
  end
end

def add(n, m)
  n + m
end

def implied(n)
  n.times do |s|
    add(1,2)
    add(3,4)
  end
end

puts '10 times'
Benchmark.ips do |x|
  x.report("explicit: ") { explicit(10) }
  x.report("implied:  ") { implied(10) }

  x.compare!
end

puts '10000 times'
Benchmark.ips do |x|
  x.report("explicit: ") { explicit(10000) }
  x.report("implied:  ") { implied(10000) }

  x.compare!
end

# 10 times
# Warming up --------------------------------------
#           explicit:    196.119k i/100ms
#           implied:      82.970k i/100ms
# Calculating -------------------------------------
#           explicit:       3.425M (± 6.4%) i/s -     17.258M in   5.060627s
#           implied:      980.377k (± 6.3%) i/s -      4.978M in   5.098439s

# Comparison:
#           explicit: :  3425134.2 i/s
#           implied:  :   980377.0 i/s - 3.49x  slower

# 10000 times
# Warming up --------------------------------------
#           explicit:    186.347k i/100ms
#           implied:     110.000  i/100ms
# Calculating -------------------------------------
#           explicit:       3.192M (± 5.5%) i/s -     16.026M in   5.035416s
#           implied:        1.098k (± 4.7%) i/s -      5.500k in   5.019319s

# Comparison:
#           explicit: :  3192186.0 i/s
#           implied:  :     1098.2 i/s - 2906.67x  slower
