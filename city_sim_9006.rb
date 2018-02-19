require_relative "Driver"
require_relative "Seed"
s = Seed.new(ARGV)
if(s.arg == "QUIT")
  puts("Illegal number of arguments were provided.")
  exit
end
drivers = []
for x in 1..5 do
  drivers << Driver::new(x,s.arg)
end
for driver in drivers
  driver.driving
end
