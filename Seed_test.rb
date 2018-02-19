require 'minitest/autorun'

require_relative 'Seed'

class SeedTest < Minitest::Test
#TESTS Seed.rb
#5 should be a legal seed, seed = 5
def test_seed_legal
  s = Seed.new(["5"])
  assert_equal s.arg,5
end
#Dog should be an illegal seed, seed = 0
def test_seed_illegal
  s = Seed.new(["dog"])
  assert_equal s.arg,0
end
#5.8 should be an illegal seed, seed = 0
def test_seed_double
  s = Seed.new(["5.8"])
  assert_equal s.arg,0
end
#Dog,5 should be an illegal seed, seed = QUIT
#EDGE CASE
def test_multiple_inputs
  s = Seed.new(["Dog","5"])
  assert_equal "QUIT",s.arg
end
# should be an illegal seed, seed = QUIT
#EDGE CASE
def test_no_input
  s = Seed.new([])
  assert_equal s.arg,"QUIT"
end
end
