class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :poster
      t.string :key
      t.integer :category_id
      t.timestamps
    end
  end
end
