class AddSuperAdminToSpreeUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_users, :is_super_admin, :boolean, default: false, null: false
    add_index :spree_users, :is_super_admin
  end
end
