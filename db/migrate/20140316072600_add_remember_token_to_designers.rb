class AddRememberTokenToDesigners < ActiveRecord::Migration
  def change
      add_column :designers, :remember_token, :string
      add_index  :designers, :remember_token
    end
end
