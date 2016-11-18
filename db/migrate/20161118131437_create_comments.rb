class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :disaster_id

      t.timestamps
    end
    add_index :comments , :disaster_id
  end
end
