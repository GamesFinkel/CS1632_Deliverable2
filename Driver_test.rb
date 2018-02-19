require 'minitest/autorun'

require_relative 'Driver'

class DriverTest < Minitest::Test
def test_names
  d1 = Driver.new("Doug",Random)
  d2 = Driver.new("Bambi",Random)
  d3 = Driver.new("Meg",Random)
  d4 = Driver.new("Cyan",Random)
  d5 = Driver.new("55010",Random)

  assert_equal d1.Name,"Driver Doug"
  assert_equal d2.Name,"Driver Bambi"
  assert_equal d3.Name,"Driver Meg"
  assert_equal d4.Name,"Driver Cyan"
  assert_equal d5.Name,"Driver 55010"
end

def test_start_loc
  d = Driver.new("Doug",Random)
  assert_includes ["Hillman","Hospital","Museum","Cathedral"],d.Location
end

def test_add_book
  d = Driver.new("Guy",Random)
  d.Books = 0
  d.Location = "Hillman"
  d.add_book
  assert_equal 1,d.Books
end


end
