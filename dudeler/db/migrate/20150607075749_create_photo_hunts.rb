class CreatePhotoHunts < ActiveRecord::Migration
  def change
    create_table :photo_hunts do |t|
      t.string :name
      t.string :content_id
      t.timestamps null: false
    end
    create_table :base_images do |t|
      t.string :image_file
      t.integer :photo_hunt_id
    end
    create_table :diff_images do |t|
      t.string :image_file
      t.integer :photo_hunt_id
    end
    add_column :images, :photo_hunt_id, :string
  end
end
