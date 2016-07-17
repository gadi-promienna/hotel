class RemoveFieldFromRooms< ActiveRecord::Migration
  def change
	remove_column :rooms, :number
  end
end
