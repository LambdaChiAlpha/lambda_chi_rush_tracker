class AddMajorToRushee < ActiveRecord::Migration
  def change
    add_column :rushees, :major, :string
  end
end
