class Room < ActiveRecord::Base
	validates_presence_of :floor, message: '- Błąd. Proszę podać piętro pokoju.'
	validates_presence_of :places, message: '- Błąd. Proszę ilość miejsc w pokoju.'
	
end
