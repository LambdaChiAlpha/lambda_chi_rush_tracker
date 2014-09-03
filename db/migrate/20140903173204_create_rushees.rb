class CreateRushees < ActiveRecord::Migration
  def self.up
    create_table :rushees do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    add_attachment :rushees, :avatar
  end

  def self.down
    remove_attachment :rushees, :avatar

    drop_table :rushees
  end
end
