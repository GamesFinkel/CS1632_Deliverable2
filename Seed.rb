class Seed
  attr_accessor :arg
  def initialize input
  if(input.count==1)
    begin
    @arg = Integer(input[0])
  rescue TypeError
      @arg = 0
  rescue ArgumentError
      @arg = 0
    end
  else @arg = "QUIT"
  end
end
end
