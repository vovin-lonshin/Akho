class CreateDaemons < ActiveRecord::Migration
  def change
    create_table :daemons do |t|
      t.string :name
      t.string :phase
      t.string :desire
      t.integer :designer_id

      t.timestamps
    end
    add_index :daemons, [:designer_id, :created_at]
  end
end
