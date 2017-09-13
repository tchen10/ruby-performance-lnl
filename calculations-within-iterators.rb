require 'benchmark/ips'

# func([1, 2, 3])  => {1 => 1, 2 => 2, 3 => 3}

def without_method(array)
  array.inject({}) { |h, e| h[e] = e; h }
end

def with_method(array)
  array.inject({}) { |h, e| h.merge(e => e) }
end


array = (0..100).to_a

Benchmark.ips do |x|
  x.report("without: ") { without_method(array) }
  x.report("with:    ") { with_method(array) }

  x.compare!
end

# Warming up --------------------------------------
# without:      2.746k i/100ms
# with:         46.000  i/100ms
# Calculating -------------------------------------
# without:      32.121k (±35.0%) i/s -    140.046k in   5.060268s
# with:         437.859  (± 8.7%) i/s -      2.208k in   5.075047s
#
# Comparison:
#   without: :    32121.2 i/s
# with:     :      437.9 i/s - 73.36x  slower

