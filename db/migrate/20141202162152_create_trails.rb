class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.string :county
      t.string :postcode
      t.text :description
      t.float :lat
      t.float :lng
      t.integer :rating
      t.float :distance
      t.integer :user_id

      t.timestamps
    end
  end
end
