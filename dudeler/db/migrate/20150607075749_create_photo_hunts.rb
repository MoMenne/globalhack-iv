class CreatePhotoHunts < ActiveRecord::Migration
  def change
    create_table :photo_hunts do |t|
      t.integer :base_image_id
      t.integer :diff_image_id
      t.string :name
      t.timestamps null: false
    end
    add_column :images, :photo_hunt_id, :string
  end
end
