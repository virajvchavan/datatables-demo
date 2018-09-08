class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.integer :salary
      t.string :country
      t.date :birth_date
      t.string :pincode

      t.timestamps null: false
    end
  end
end
