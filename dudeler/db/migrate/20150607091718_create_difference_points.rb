class CreateDifferencePoints < ActiveRecord::Migration
  def change
    create_table :difference_points do |t|
      t.integer :x
      t.integer :y
      t.integer :photo_hunt_id
      t.timestamps null: false
    end
  end
end
