class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :submitter
      t.text :content
      t.integer :impression, default: 1
      t.integer :rushee_id

      t.timestamps
    end
  end
end
