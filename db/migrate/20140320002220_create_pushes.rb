class CreatePushes < ActiveRecord::Migration
  def change
    create_table :pushes do |t|
      t.string :content
     
      t.references :pushable, polymorphic: true
  

      t.timestamps
    end
    
    add_index(:pushes, [ :pushable_type, :pushable_id, :created_at], name: 'pushes_on_pushable_by_created_at')
    
  end
end
