class CreateTableAddress < ActiveRecord::Migration[5.1]
  def up
    create_table :addresses do |t|
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :state
      t.string :pincode
      t.string :country
      t.integer :applicant_id
    end
  end

  def down
    drop_table :address
  end
end
