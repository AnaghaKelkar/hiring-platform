class CreateTableAddress < ActiveRecord::Migration[5.1]
  def up
    create_table :addresses do |t|
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :state
      t.string :pincode
      t.string :country
      t.integer :addressable_id
      t.string :addressable_type
    end
  end

  def down
    drop_table :addresses
  end
end
