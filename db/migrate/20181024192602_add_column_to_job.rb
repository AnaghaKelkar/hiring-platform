class AddColumnToJob < ActiveRecord::Migration[5.1]
  def up
    add_column :jobs, :created_at, :datetime
  end

  def down
    remove_column :jobs, :created_at, :datetime
  end
end
