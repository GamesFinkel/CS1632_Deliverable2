require_relative "City"
class Driver
  attr_accessor :Name, :Location, :Books, :Dinos, :Classes
  def initialize number,rng
    @Number = number
    @Name = "Driver #{@Number}"
    @City = City.new
    @Location = @City.Locs.sample(random: rng)
    @Books = 0
    @Dinos = 0
    @Classes = 1
    add_book
    add_dino
    attend_class
    @Random = rng
    end
  def add_book
    if(@Location=="Hillman")
      @Books = @Books + 1
    end
  end

  def add_dino
    if(@Location=="Museum")
      @Dinos = @Dinos + 1
    end
  end

  def attend_class
    if(@Location=="Cathedral")
      @Classes = @Classes * 2
    end
  end
  def getRoad
    if(@Location == "Hillman")
      road = @City.Hillman.sample(random: @Random)
    elsif(@Location == "Hospital")
      road = @City.Hospital.sample(random: @Random)
    elsif(@Location == "Cathedral")
      road = @City.Cathedral.sample(random: @Random)
    elsif(@Location == "Museum")
      road = @City.Museum.sample(random: @Random)
    end
    road
  end
  def getNextLoc road
    if(road.include?"St.")
      if(@Location == "Hillman")
        next_location = "Hospital"
      elsif(@Location == "Hospital")
        next_location = "Hillman"
      elsif(@Location == "Cathedral")
        next_location = "Museum"
      elsif(@Location == "Museum")
        next_location = "Cathedral"
      end
    elsif(road.include? "Ave.")
      if(@Location=="Hillman")
        next_location = "Downtown"
      elsif(@Location == "Museum")
        next_location = "Hillman"
      elsif(@Location == "Hospital")
        next_location = "Cathedral"
      elsif(@Location == "Cathedral")
        next_location = "Monroeville"
      end
    end
    next_location
  end
  def driving
    until @Location == "Downtown"||@Location == "Monroeville"
      road = getRoad
      next_location = getNextLoc(road)
        puts "#{@Name} heading from #{@Location} to #{next_location} via #{road}"
        @Location = next_location
        add_book
        add_dino
        attend_class


  end
  if(@Books==1)
    puts "#{@Name} obtained 1 book!"
  else puts "#{@Name} obtained #{@Books} books!"
  end

  if(@Dinos==1)
    puts "#{@Name} obtained 1 dinosaur toy!"
  else puts "#{@Name} obtained #{@Dinos} dinosaur toys!"
  end

  if(@Classes==1)
    puts "#{@Name} attended 1 class!"
  else puts "#{@Name} attended #{@Classes} classes!"
  end
end
end
