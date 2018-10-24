class CreateJobs < ActiveRecord::Migration[5.1]
  def up
    create_table :jobs do |t|
      t.string     :job_uid
      t.string     :title
      t.string     :description
      t.string     :minimum_requirement
      t.integer    :status
      t.integer    :admin_id
    end
  end

  def down
    drop_table :jobs
  end
end
