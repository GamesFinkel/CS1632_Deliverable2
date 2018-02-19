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

#UNIT TESTS FOR METHOD add_book
#If location is Hillman, book should increment
def test_add_book
  d = Driver.new("Guy",Random)
  books = d.Books
  d.Location = "Hillman"
  d.add_book
  assert_equal books+1,d.Books
end
#If location is not Hillman, book should not increment
def test_add_book_away
  d = Driver.new("Guy",Random)
  books = d.Books
  d.Location = "Duck"
  d.add_book
  assert_equal books,d.Books
end

#UNIT TESTS FOR METHOD add_dino
#If location is Museum, dino should increment
def test_add_dino
  d = Driver.new("Guy",Random)
  dinos = d.Dinos
  d.Location = "Museum"
  d.add_dino
  assert_equal dinos+1,d.Dinos
end
#If location is not Museum, dino should not increment
def test_add_dino_away
  d = Driver.new("Guy",Random)
  dinos = d.Dinos
  d.Location = "Duck"
  d.add_dino
  assert_equal dinos,d.Dinos
end

#UNIT TESTS FOR METHOD attend_class
#If location is Cathedral, classes should double
def test_attend_class
  d = Driver.new("Guy",Random)
  classes = d.Classes
  d.Location = "Cathedral"
  d.attend_class
  assert_equal classes*2,d.Classes
end
#If location is not Cathedral, classes should not double
def test_attend_class_away
  d = Driver.new("Guy",Random)
  classes = d.Classes
  d.Location = "Duck"
  d.attend_class
  assert_equal classes,d.Classes
end

#UNIT TESTS FOR METHOD driving
#Should drive until location is Downtown or Monroeville
def test_end_location
  d = Driver.new("0",Random)
  d.driving
  assert_includes ["Monroeville","Downtown"],d.Location
end
#Should not end with 0 books, 1 class, and 0 dinos
def test_end_items
  d = Driver.new("0",Random)
  d.driving
  assert d.Books>0 ||d.Classes>1||d.Dinos>0
end

#UNIT TESTS FOR METHOD getRoad
#Equivalence Classes
#Location = Museum => Road = Bar || Fifth
#Location = Cathedral => Road = Bar || Fourth
#Location = Hillman => Road = Foo || Fifth
#Location = Hospital => Road = Foo || Fourth
#Taking Fourth from Cathy should end in Monroeville
def test_cathedral_to_monroeville
  d = Driver.new("0",Random)
  d.Location = "Cathedral"
  assert_equal d.getNextLoc("Fourth Ave."),"Monroeville"
end
#Taking Fifth from Hillman should end in Downtown
def test_hillman_to_downtown
  d = Driver.new("0",Random)
  d.Location = "Hillman"
  assert_equal d.getNextLoc("Fifth Ave."),"Downtown"
end

end
