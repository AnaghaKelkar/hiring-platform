class CreateTableApplicants < ActiveRecord::Migration[5.1]
  def up
    create_table :applicants do |t|
    end
  end

  def down
  	drop_table :applicants
  end
end
