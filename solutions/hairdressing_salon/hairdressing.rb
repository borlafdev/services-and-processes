#!/usr/bin/env ruby 
# hairdressing.rb

require_relative 'Chair'
require_relative 'client'


mutex = Mutex.new
queue = Array.new
chairs = Array.new
hairdressers = Array.new
clients_number = 0

4.times do 
	chairs << Chair.new
end

clients = Thread.new do 
       sleep(rand(3));
       while(clients_number < 21) do
       mutex.synchronize { 
          queue.push Client.new 
       }
       clients_number+=1
   end
end
clients.join

hairdressers << Thread.new do 
    unless queue.empty?
    number = rand(3)
    mutex.synchronize { 
    	if(chairs[number].empty?)
      	chairs[number].attend(queue.shift.id?)
      	end
    }
    sleep(rand(27))
    end
end

hairdressers.each do |thread|
	thread.join
end

