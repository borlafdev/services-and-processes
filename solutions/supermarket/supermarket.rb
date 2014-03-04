#!/usr/bin/env ruby 
# supermarket.rb

require_relative 'employee'
require_relative 'client'

milk_quantity = 200
mutex = Mutex.new
queue = Array.new
employees = Array.new
clients_number = 0


hilo = Thread.new do
      sleep(2) 
       while(clients_number < 40) do
        sleep(rand(1));
       mutex.synchronize { 
          queue.push Client.new(rand(6)+1) 
       }
       clients_number+=1
   end
end

hilo.join

8.times do |number|
employees << Thread.new do 
      while (!queue.empty?) do
        employe = Employee.new
        if employe.assigned_work? == "Attend"
          mutex.synchronize { 
          milk_quantity = milk_quantity - queue.first.milk?
          puts "Attended client #{queue.first.id?} who has #{queue.shift.milk?} liters of milk"
          puts "Remaining milk #{milk_quantity}"
        }
        elsif employe.assigned_work? == "Replace"
          mutex.synchronize { 
            if milk_quantity < 194
              milk_quantity+=6
              puts "Added 6 liters of milk to the stock"
            end
          }
        end
        

        sleep(rand(5))
      end
    end
end


employees.each do |thread|
	thread.join
end
