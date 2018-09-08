class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :position
      t.integer :salary
      t.string :office
      t.date :start_date
      t.string :extn

      t.timestamps null: false
    end
  end
end
