class CreateCirciuts < ActiveRecord::Migration
  def change
    create_table :circiuts do |t|
      t.string :url
      t.integer :designer_id
      t.integer :daemon_id

      t.timestamps
    end
    add_index :circiuts, [:designer_id, :created_at, :daemon_id]
  end
end
