class Chair
  @ocupped = false 
  @@number = 0

  def initialize
  	@@number+1
  	@number = @@number
  end

  def attend(client_id)
 	 puts "Attended client #{client_id} in chair #{@number}"
     @ocupped = true
  end

  def free
  	@ocupped = false
  end

  def empty?
    @occupped
  end

end