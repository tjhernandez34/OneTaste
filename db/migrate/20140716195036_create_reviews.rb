class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id
      t.integer :restaurant_id
      t.text :content
      t.string :title

      t.timestamps
    end
  end
end
