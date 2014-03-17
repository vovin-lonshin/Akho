class AddAdminToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :admin, :boolean, default: false
  end
end
