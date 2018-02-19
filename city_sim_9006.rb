require_relative "Driver"

if(ARGV.count!=1)
  puts("No arguments were provided.")
  exit
end
begin
  input = Integer(ARGV[0])
  rescue ArgumentError
    input = 0
end
rng = Random.new(input)
drivers = []
for x in 1..5 do
  drivers << Driver::new(x,rng)
end
for driver in drivers
  driver.driving
end
