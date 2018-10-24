class AddNameAndTypeToUser < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :name, :string
    add_column :users, :loginable_id, :integer
    add_column :users, :loginable_type, :string
  end

  def down
  	remove_column :users, :name, :string
    remove_column :users, :loginable_id, :integer
    remove_column :users, :loginable_type, :string
  end
end
