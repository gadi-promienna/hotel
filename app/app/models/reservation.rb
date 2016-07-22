class Reservation < ActiveRecord::Base
  
  validates_presence_of :date_possible, message: " - Data niemożliwa"
  validates_presence_of :days, message: '- Błąd. Proszę podać długość rezerwacji.'
  validates_presence_of :start, message: '- Błąd. Proszę podać początkową datę rezerwacji.'
  validates_presence_of :room_free, message: " - Nie da się zarejestrować pokoju."
  belongs_to :room
  belongs_to :user

  #Metoda sprawdzająca czy rejestracja jest możliwa w wybranych dniach.
  def room_free
    #Wybranie rezerwacji danego pokoju, które są aktualne i różne od aktualizowanej.
    if(self.days)
    	@reservations = Reservation.all.where(room_id: self.room_id).select { 
    			|reservation| ((reservation.start + reservation.days>= Date.today)&&(reservation!=@reservation))
        
    		}
      @end = self.start + self.days
      @check_time = (self.start..@end).to_a
      el=0
      #Pętla dla wybranych rezerwacji. Tworzy tablicę dat reserved_time - od poczatkowej daty danej rezerwacji do daty końcowej.
      #Sprawdza czy istnieje część wspólna tablicy reserved_time z tablicą z datami dodawanej rezerwacji.
    	@reservations.each do |reservation|
    		 reservation_end = reservation.start + reservation.days
      	 reserved_time = (reservation.start..reservation_end).to_a
      #Sprawdzanie czy istnieje część wspólna (common_day) tablicy reserved_time z datami wybranych rezerwacji i tablic z datami dodawanej rezerwacji.      	
         common_day = reserved_time&@check_time
      #Jeśli tablica common_day zawiera elementy wyrzucenie komunikatu o błędzie. 
      #Zmienna el sprawsza czy jest to pierwszy wyświetlany komunikat o tym błędzie.
      #Jeśli kolejny treść komuniatu zostaje skróca.
  		if(common_day.count>0) 
          then 
            if(el==0) then errors.add("Ten pokój jest już zarezerwowany w dniach: ", "#{common_day.join(", ")}")
              el=1
            else 
              errors.add("A także:", "#{common_day.join(", ")}")
            end
    		end
    	end
      else true
    end
  end

  #Błąd jeśli data początkowa rejestracji już minęła.
  def date_possible
    if(self.start < Date.today) then errors.add("Niestety niemożliwa jest rejestracja pokoju w przeszłości.", "")
    else true
    end
  end

end
