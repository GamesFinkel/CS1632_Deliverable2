require 'minitest/autorun'

require_relative 'Driver'
require_relative 'Seed'
class DriverTest < Minitest::Test
def test_names
  d1 = Driver.new("Doug",0)
  d2 = Driver.new("Bambi",0)
  d3 = Driver.new("Meg",0)
  d4 = Driver.new("Cyan",0)
  d5 = Driver.new("55010",0)

  assert_equal d1.Name,"Driver Doug"
  assert_equal d2.Name,"Driver Bambi"
  assert_equal d3.Name,"Driver Meg"
  assert_equal d4.Name,"Driver Cyan"
  assert_equal d5.Name,"Driver 55010"
end

def test_start_loc
  d = Driver.new("Doug",0)
  assert_includes ["Hillman","Hospital","Museum","Cathedral"],d.Location
end

#UNIT TESTS FOR METHOD add_book
#If location is Hillman, book should increment
def test_add_book
  d = Driver.new("Guy",0)
  books = d.Books
  d.Location = "Hillman"
  d.add_book
  assert_equal books+1,d.Books
end
#If location is not Hillman, book should not increment
def test_add_book_away
  d = Driver.new("Guy",0)
  books = d.Books
  d.Location = "Duck"
  d.add_book
  assert_equal books,d.Books
end

#UNIT TESTS FOR METHOD add_dino
#If location is Museum, dino should increment
def test_add_dino
  d = Driver.new("Guy",0)
  dinos = d.Dinos
  d.Location = "Museum"
  d.add_dino
  assert_equal dinos+1,d.Dinos
end
#If location is not Museum, dino should not increment
def test_add_dino_away
  d = Driver.new("Guy",0)
  dinos = d.Dinos
  d.Location = "Duck"
  d.add_dino
  assert_equal dinos,d.Dinos
end

#UNIT TESTS FOR METHOD attend_class
#If location is Cathedral, classes should double
def test_attend_class
  real = Driver.new("Tom",0)
  real.Location = "Cathedral"
  d = Minitest::Mock.new
  d.expect :Location, "Cathedral"
  d.expect :Classes, 2
  Driver.stub :new, d do
  driver = Driver.new
  assert_equal driver.Location, "Cathedral"
  refute_equal real.Classes,2
  real.attend_class
  assert_equal real.Classes,driver.Classes
end
end
#If location is not Cathedral, classes should not double
def test_attend_class_away
  d = Driver.new("Guy",0)
  classes = d.Classes
  d.Location = "Duck"
  d.attend_class
  assert_equal classes,d.Classes
end

#UNIT TESTS FOR METHOD driving
#Should drive until location is Downtown or Monroeville
def test_end_location
  d = Driver.new("0",0)
  d.driving
  assert_includes ["Monroeville","Downtown"],d.Location
end
#Should not end with 0 books, 1 class, and 0 dinos
def test_end_items
  d = Driver.new("0",0)
  d.driving
  assert d.Books>0 ||d.Classes>1||d.Dinos>0
end
#Name becomes Driver Keith
def test_stub_name
  driver = Minitest::Mock.new
  driver.expect :Name, "Driver Keith"
  Driver.stub :new, driver do
    k = Driver.new
    assert_equal k.Name, "Driver Keith"
  end
end
#UNIT TESTS FOR METHOD getRoad
#Equivalence Classes
#Location = Museum => Road = Bar || Fifth
#Location = Cathedral => Road = Bar || Fourth
#Location = Hillman => Road = Foo || Fifth
#Location = Hospital => Road = Foo || Fourth
#Taking Fourth from Cathy should end in Monroeville
def test_cathedral_to_monroeville
  d = Driver.new("0",0)
  d.Location = "Cathedral"
  assert_equal d.getNextLoc("Fourth Ave."),"Monroeville"
end
#Taking Fifth from Hillman should end in Downtown
def test_hillman_to_downtown
  d = Driver.new("0",0)
  d.Location = "Hillman"
  assert_equal d.getNextLoc("Fifth Ave."),"Downtown"
end
#Identical seeds should produce the same situations
def test_identical_seeds
  s1 = Minitest::Mock::new "seed 1"
  s2 = Minitest::Mock::new "seed 2"
  def s1.arg; 0;end
  def s2.arg; 0;end

  d1 = Driver.new("Clark",s1.arg)
  d2 = Driver.new("Kent",s2.arg)
  assert_equal d1.Location,d2.Location
  d1.driving
  d2.driving
  assert_equal d1.Dinos,d2.Dinos
  assert_equal d1.Classes,d2.Classes
  assert_equal d1.Books,d2.Books
  assert_equal d1.Location,d2.Location
end
#Should not drive after finished
#EDGE CASE
def test_complete_run
  s1 = Minitest::Mock::new "seed 1"
  def s1.arg; 0;end
  d1 = Driver.new("Clark",s1.arg)
  d1.driving
  books = d1.Books
  classes = d1.Classes
  dinos = d1.Dinos
  assert_includes ["Downtown","Monroeville"],d1.Location
  assert_equal d1.Status, "None"
  d1.driving
  assert_equal d1.Status,"Double Jeopardy"
  assert_equal d1.Classes,classes
  assert_equal d1.Books,books
  assert_equal d1.Dinos,dinos
end

end
