class AddRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :text
  end
end
