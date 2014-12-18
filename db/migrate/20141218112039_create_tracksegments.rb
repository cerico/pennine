class CreateTracksegments < ActiveRecord::Migration
  def change
    create_table :tracksegments do |t|
      t.references :trail

      t.timestamps
    end
    add_index :tracksegments, :trail_id
  end
end
