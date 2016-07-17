class RenameEnd < ActiveRecord::Migration
  def change
	rename_column :reservations, :end, :days
  end
end
