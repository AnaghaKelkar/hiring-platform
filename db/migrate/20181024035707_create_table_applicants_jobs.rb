class CreateTableApplicantsJobs < ActiveRecord::Migration[5.1]
  def up
    create_table :applicants_jobs do |t|
    	t.integer :applicant_id
    	t.integer :job_id
    end
  end

  def down
  	drop_table :applicants_jobs
  end
end
