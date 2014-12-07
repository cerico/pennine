class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :trail_id
      t.integer :user_id
      t.boolean :completed
      t.boolean :favourited
      t.integer :rating

      t.timestamps
    end
  end
end
