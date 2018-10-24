class CreateTableAdmins < ActiveRecord::Migration[5.1]
  def up
    create_table :admins do |t|
    end
  end

  def down
  	drop_table :admins
  end
end
