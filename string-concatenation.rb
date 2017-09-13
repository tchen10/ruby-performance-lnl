require 'benchmark/ips'

#using +=
def concat_string(n)
  concatenated_string = ''
  string_to_add = 's' * 100
  n.times do |s|
    concatenated_string += string_to_add
  end
end

#using <<
def modify_string(n)
  concatenated_string = ''
  string_to_add = 's' * 100
  n.times do |s|
    concatenated_string << string_to_add
  end
end

puts '5 times'
Benchmark.ips do |x|
  x.report("concat: ") { concat_string(5) }
  x.report("modify: ") { modify_string(5) }

  x.compare!
end

puts '100 times'
Benchmark.ips do |x|
  x.report("concat: ") { concat_string(100) }
  x.report("modify: ") { modify_string(100) }

  x.compare!
end

# 5 times
# Warming up --------------------------------------
#             concat:     42.527k i/100ms
#             modify:     50.162k i/100ms
# Calculating -------------------------------------
#             concat:     450.498k (± 5.7%) i/s -      2.254M in   5.020328s
#             modify:     570.995k (± 4.5%) i/s -      2.859M in   5.017842s

# Comparison:
#             modify: :   570995.3 i/s
#             concat: :   450498.4 i/s - 1.27x  slower

# 100 times
# Warming up --------------------------------------
#             concat:    912.000  i/100ms
#             modify:      7.235k i/100ms
# Calculating -------------------------------------
#             concat:       8.690k (±19.4%) i/s -     42.864k in   5.081115s
#             modify:      73.701k (± 3.9%) i/s -    368.985k in   5.014085s

# Comparison:
#             modify: :    73700.6 i/s
#             concat: :     8689.9 i/s - 8.48x  slower
