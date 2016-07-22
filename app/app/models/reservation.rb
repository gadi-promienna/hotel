class Reservation < ActiveRecord::Base
  
  validates_presence_of :date_possible, message: " - Data niemożliwa"
  validates_presence_of :days, message: '- Błąd. Proszę podać długość rezerwacji.'
  validates_presence_of :start, message: '- Błąd. Proszę podać początkową datę rezerwacji.'
  validates_presence_of :room_free, message: " - Nie da się zarejestrować pokoju."
  belongs_to :room
  belongs_to :user

  #Sprawdzenie czy rejestracja jest możliwa w wybranych dniach.
  def room_free
    if(self.days)
    	@reservations = Reservation.all.where(room_id: self.room_id).select { 
    			|reservation| (reservation.start + reservation.days) >= Date.today
    		}
      @end = self.start + self.days
      @check_time = (self.start..@end).to_a
      el=0
    	@reservations.each do |reservation|
    		 reservation_end = reservation.start + reservation.days
      	 reserved_time = (reservation.start..reservation_end).to_a
      	 common_day = reserved_time&@check_time
  		if(common_day.count>0) 
          then 
            if(el==0) then errors.add("Ten pokój jest już zarezerwowany w dniach: ", "#{common_day.join(", ")}")
              el=1
            else 
              errors.add("A także:", "#{common_day.join(", ")}")
            end
    		end
    	end
    end
  end

  #Błąd jeśli data początkowa rejestracji już minęła.
  def date_possible
    if(self.start < Date.today) then errors.add("Niestety niemożliwa jest rejestracja pokoju w przeszłości.", "")
    end
  end

end
