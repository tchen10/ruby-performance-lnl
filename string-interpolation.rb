require 'benchmark/ips'

def double_quoted(n)
  char = 'x'
  n.times do |s|
    cat = "catcatcatcatcatcatcatcatcatcatcatcatcatc#{char}atcatcatcatcatcatcatcatcatcatcatcatcatcat#{char}catcat"
  end
end

def single_quoted(n)
  char = 'x'
  n.times do |s|
    cat = 'catcatcatcatcatcatcatcatcatcatcatcatcatc' + char + 'atcatcatcatcatcatcatcatcatcatcatcatcatcat' + char +'catcat'
  end
end

Benchmark.ips do |x|
  x.report("double: ") { double_quoted(50_000) }
  x.report("single: ") { single_quoted(50_000) }

  x.compare!
end
