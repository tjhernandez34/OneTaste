class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :review_id
      t.integer :parent_id
      t.text :content
      t.integer :commenter_id

      t.timestamps
    end
  end
end
