require 'benchmark/ips'

class Metric
  attr_accessor :var

  def initialize(n)
    @n = n
    @var = 22
  end

  def run
    Benchmark.ips do |x|
      x.report("@var       :") { @n.times { @var } }
      x.report("var        :") { @n.times { var } }
      x.report("@var =     :") { @n.times { |i| @var = i } }
      x.report("self.var = :") { @n.times { |i| self.var = i } }

      x.compare!
    end
  end
end

metric = Metric.new(100_000_000)
metric.run

# Warming up --------------------------------------
#         @var       :     1.000  i/100ms
#         var        :     1.000  i/100ms
#         @var =     :     1.000  i/100ms
#         self.var = :     1.000  i/100ms
# Calculating -------------------------------------
#         @var       :      0.249  (± 0.0%) i/s -      2.000  in   8.019986s
#         var        :      0.223  (± 0.0%) i/s -      2.000  in   8.977378s
#         @var =     :      0.226  (± 0.0%) i/s -      2.000  in   8.868795s
#         self.var = :      0.196  (± 0.0%) i/s -      1.000  in   5.114904s

# Comparison:
#         @var       ::        0.2 i/s
#         @var =     ::        0.2 i/s - 1.11x  slower
#         var        ::        0.2 i/s - 1.12x  slower
#         self.var = ::        0.2 i/s - 1.28x  slower
