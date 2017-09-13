require 'benchmark/ips'

def tuple(n)
  n.times do
    a, b = 10, 20
  end
end

def multiline(n)
  n.times do
    a = 10
    b = 20
  end
end


Benchmark.ips do |x|
  x.report("tuple: ") { tuple(10_000_000) }
  x.report("multi: ") { multiline(10_000_000) }

  x.compare!
end

# Warming up --------------------------------------
#              tuple:      1.000  i/100ms
#              multi:      1.000  i/100ms
# Calculating -------------------------------------
#              tuple:       1.242  (± 0.0%) i/s -      7.000  in   5.634616s
#              multi:       2.128  (± 0.0%) i/s -     11.000  in   5.169936s

# Comparison:
#              multi: :        2.1 i/s
#              tuple: :        1.2 i/s - 1.71x  slower
