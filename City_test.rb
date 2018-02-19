require 'minitest/autorun'

require_relative 'City'

class CityTest < Minitest::Test
  def setup
    @City = City::new
end
#Locations should be Hospital, Cathedral, Hillman, Museum in that order
def test_four_locs
  loc1 = @City.Locs[0]
  loc2 = @City.Locs[1]
  loc3 = @City.Locs[2]
  loc4 = @City.Locs[3]
  assert_equal loc1,"Hospital"
  assert_equal loc2,"Cathedral"
  assert_equal loc3,"Hillman"
  assert_equal loc4,"Museum"
end
#Check that picking a random road from Hillman results in Foo or Fifth
def test_hillman
  loc1 = @City.Hillman
  road = loc1.sample
  assert_includes ["Foo St.","Fifth Ave."], road
end
#Check that picking a random road from Hospital results in Foo or Fourth
def test_hospital
  loc1 = @City.Hospital
  road = loc1.sample
  assert_includes ["Foo St.","Fourth Ave."], road
end
#Check that picking a random road from Cathedral results in Bar or Fourth
def test_cathedral
  loc1 = @City.Cathedral
  road = loc1.sample
  assert_includes ["Bar St.","Fourth Ave."], road
end
#Check that picking a random road from Museum results in Bar or Fifth
def test_museum
  loc1 = @City.Museum
  road = loc1.sample
  assert_includes ["Bar St.","Fifth Ave."], road
end

end
