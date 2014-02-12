class RolesInOneColumn < ActiveRecord::Migration
  def change
    remove_column :users, :admin
    remove_column :users, :authorized
    add_column :users, :role, :string
  end
end
