class AddUserIdToUsers < ActiveRecord::Migration[5.0]
  add_column :disasters, :user_id, :string
  add_index :disasters, :user_id
end 