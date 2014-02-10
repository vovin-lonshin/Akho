class AddIndexToDesignersEmail < ActiveRecord::Migration
  def change
    add_index :designers, :email, unique: true
  end
end
