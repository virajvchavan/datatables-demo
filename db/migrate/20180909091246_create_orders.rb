class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :dish_name
      t.string :quantity
      t.integer :price
      t.string :location
      t.datetime :order_time

      t.timestamps null: false
    end
  end
end
