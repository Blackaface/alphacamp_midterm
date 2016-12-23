class AddUserIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :disasters, :user_id, :string
    add_index  :disasters, :user_id
  end
end 