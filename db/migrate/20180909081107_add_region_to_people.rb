class AddRegionToPeople < ActiveRecord::Migration
  def change
    add_column :people, :region, :string
  end
end
