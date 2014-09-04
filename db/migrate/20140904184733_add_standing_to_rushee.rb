class AddStandingToRushee < ActiveRecord::Migration
  def change
    add_column :rushees, :standing, :integer, default: 0
  end
end
