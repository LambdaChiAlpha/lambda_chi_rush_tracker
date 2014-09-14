class AddHallAndRoomNumberToRushee < ActiveRecord::Migration
  def change
    add_column :rushees, :hall, :integer
    add_column :rushees, :room_number, :integer
  end
end
