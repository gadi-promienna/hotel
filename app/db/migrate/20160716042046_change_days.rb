class ChangeDays < ActiveRecord::Migration
  def change
	change_column :reservations, :days, :integer
  end
end
