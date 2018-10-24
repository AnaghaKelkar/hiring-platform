class AddColumnToAdmins < ActiveRecord::Migration[5.1]
  def up
    add_column :admins, :title, :string
    add_column :admins, :mobile_number, :string
    add_column :admins, :founded_in, :string
    add_column :admins, :size, :integer
    add_column :admins, :positions, :string
    add_column :admins, :hiring, :boolean
  end

  def down
    remove_column :admins, :title, :string
    remove_column :admins, :mobile_number, :string
    remove_column :admins, :founded_in, :string
    remove_column :admins, :size, :integer
    remove_column :admins, :positions, :string
    remove_column :admins, :hiring, :boolean
  end
end
