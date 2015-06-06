class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :text
      t.string :image_file
      t.string :content_id

      t.timestamps null: false
    end
  end
end
