class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :member, :boolean

    add_index :users, :username, unique: true
  end
end
