class AddColumnsToApplicant < ActiveRecord::Migration[5.1]
  def up
    add_column :applicants, :mobile_number, :string
    add_column :applicants, :start_date, :datetime
    add_column :applicants, :degree, :string
    add_column :applicants, :roles_interested, :string
    add_column :applicants, :employers, :string
    add_column :applicants, :education, :string
    add_column :applicants, :description, :string
  end

  def down
    remove_column :applicants, :mobile_number, :string
    remove_column :applicants, :start_date, :datetime
    remove_column :applicants, :degree, :string
    remove_column :applicants, :roles_interested, :string
    remove_column :applicants, :employers, :string
    remove_column :applicants, :education, :string
    remove_column :applicants, :description, :string
  end
end
