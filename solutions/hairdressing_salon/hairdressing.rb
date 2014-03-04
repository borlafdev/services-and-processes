#!/usr/bin/env ruby 
# hairdressing.rb

require_relative 'chair'
require_relative 'client'


mutex = Mutex.new
queue = Array.new
chairs = Array.new
hairdressers = Array.new
clients_number = 0

4.times do 
	chairs << Chair.new
end


hilo = Thread.new do 
       while(clients_number < 21) do
        sleep(rand(3));
       mutex.synchronize { 
          queue.push Client.new 
       }
       clients_number+=1
   end
end

hilo.join

4.times do |number|
hairdressers << Thread.new do 
      while (!queue.empty?) do
        mutex.synchronize { 
          chairs[number].attend(queue.shift.id?)
        }
        sleep(rand(5))
      end
    end
end


hairdressers.each do |thread|
	thread.join
end


