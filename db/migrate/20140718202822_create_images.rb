class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :caption
      t.integer :restaurant_id
      t.integer :user_id
      t.string :image
      t.timestamps
    end
  end
end
