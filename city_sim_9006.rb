require_relative "Driver"
require_relative "Seed"
s = Seed.new(ARGV)
if(s.arg == "QUIT")
  puts("Illegal number of arguments were provided.")
  exit
end
drivers = []
rng = Random.new(s.arg)
for x in 1..5 do
  drivers << Driver::new(x,rng)
end
for driver in drivers
  driver.driving
end
