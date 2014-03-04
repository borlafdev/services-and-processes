class Employee

  @@number = 0 
  @@assigned_work = ["Attend","Replace"]

  def initialize
     @@number += 1
     @number   = @@number
     @assigned_work = @@assigned_work[rand(2)]
  end

  def id?
    @number
  end

  def assigned_work?
  	@assigned_work
  end

end


