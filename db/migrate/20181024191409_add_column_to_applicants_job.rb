class AddColumnToApplicantsJob < ActiveRecord::Migration[5.1]
  def up
  	add_column :applicants_jobs, :created_at, :datetime
  end

  def down
  	remove_column :applicants_jobs, :created_at, :datetime
  end
end
