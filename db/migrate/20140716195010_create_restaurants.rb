class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :creator_id
      t.string :street_address
      t.string :city
      t.string :state
      t.string :category

      t.timestamps
    end
  end
end
