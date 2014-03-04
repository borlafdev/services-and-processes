class Client 

  @@number = 0 
  @@milk = 0
  def initialize(milk)
     @@number += 1
     @number   = @@number
     puts "Hi. I'm client number #{@number}."
     @milk = milk
  end

  def id?
    @number
  end

  def milk?
  	@milk
  end

end


