class CreateCircuits < ActiveRecord::Migration
  def change
    create_table :circuits do |t|
      t.string :url
      t.integer :designer_id
      t.integer :daemon_id

      t.timestamps
    end
    add_index :circuits, [:designer_id, :created_at, :daemon_id]
  end
end
