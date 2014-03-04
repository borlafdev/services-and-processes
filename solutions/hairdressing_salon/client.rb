class Client 

  @@number = 0 

  def initialize
     @@number += 1
     @number   = @@number
     puts "Hi. I'm client number #{@number}."
  end

  def id?
    @number
  end

end


