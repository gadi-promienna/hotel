#Wylosowanie dwudziestu losowych pokoi.
class AddInitialRooms < ActiveRecord::Migration
  def up
	
	5.times do 
	stand = Random.rand(3)+1
	places = Random.rand(4)+1
	case stand
	 when 1
	  stand = "normalny"
	 when 2
	  stand = "podwyższony"
  	 when 3
	  stand = "luksusowy"
	end
	Room.create(floor: "4", standard: "#{stand}", places: "#{places}")
	end

		5.times do 
	stand = Random.rand(3)+1
	places = Random.rand(4)+1
	case stand
	 when 1
	  stand = "normalny"
	 when 2
	  stand = "podwyższony"
  	 when 3
	  stand = "luksusowy"
	end
	Room.create(floor: "3", standard: "#{stand}", places: "#{places}")
	end

		5.times do 
	stand = Random.rand(3)+1
	places = Random.rand(4)+1
	case stand
	 when 1
	  stand = "normalny"
	 when 2
	  stand = "podwyższony"
  	 when 3
	  stand = "luksusowy"
	end
	Room.create(floor: "2", standard: "#{stand}", places: "#{places}")
	end

		5.times do 
	stand = Random.rand(3)+1
	places = Random.rand(4)+1
	case stand
	 when 1
	  stand = "normalny"
	 when 2
	  stand = "podwyższony"
  	 when 3
	  stand = "luksusowy"
	end
	Room.create(floor: "1", standard: "#{stand}", places: "#{places}")
	end

 end
end
