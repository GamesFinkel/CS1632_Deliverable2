class City
attr_accessor :Locs,:Hospital,:Cathedral, :Hillman, :Museum
  def initialize
    @Locs = ["Hospital","Cathedral","Hillman","Museum"]

    @Hospital = ["Foo St.","Fourth Ave."]
    @Cathedral = ["Bar St.","Fourth Ave."]
    @Hillman = ["Foo St.","Fifth Ave."]
    @Museum = ["Bar St.","Fifth Ave."]
  end
end
