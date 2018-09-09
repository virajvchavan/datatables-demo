class AddCustomerNameToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :custome_name, :string
  end
end
