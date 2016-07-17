class AgainCreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :number
      t.integer :floor
      t.integer :places
      t.string :standard

      t.timestamps null: false
    end
  end
end
