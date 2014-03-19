class CreateBulletins < ActiveRecord::Migration
  def change
    create_table :bulletins do |t|
      t.string :content
      t.integer :designer_id

      t.timestamps
    end
    add_index :bulletins, [:created_at]
  end
end
