require 'benchmark/ips'

def merge!(array)
  array.inject({}) { |h, e| h.merge!(e => e) }
end

def merge(array)
  array.inject({}) { |h, e| h.merge(e => e) }
end

N = 10_000
array = (0..N).to_a

Benchmark.ips do |x|
  x.report("with_bang: ") { merge!(array) }
  x.report("without:   ") { merge(array) }

  x.compare!
end

# Warming up --------------------------------------
#          with_bang:     16.000  i/100ms
#          without:        1.000  i/100ms
# Calculating -------------------------------------
#          with_bang:     181.774  (± 5.5%) i/s -    912.000  in   5.031422s
#          without:         0.510  (± 0.0%) i/s -      3.000  in   5.881483s

# Comparison:
#          with_bang: :      181.8 i/s
#          without:   :        0.5 i/s - 356.35x  slower
