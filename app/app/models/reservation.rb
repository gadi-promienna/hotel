class Reservation < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  validate :room_free
  def room_free
  	@reservations = Reservation.all.where(room_id: self.room_id).select { 
  			|reservation| (reservation.start + reservation.days) >= Date.today
  		}
    @end = self.start + self.days
    @check_time = (self.start..@end).to_a
  	@reservations.each do |reservation|
  		 reservation_end = reservation.start + reservation.days
    	 reserved_time = (reservation.start..reservation_end).to_a
    	 common_day = reserved_time&@check_time
		if(common_day.count>0) then errors.add("Ten pokój jest już zarezerwowany w dniach: ", "#{common_day.join(", ")}")
  		end
  	end
  end
end
