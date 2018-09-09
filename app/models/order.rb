# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  dish_name    :string
#  quantity     :string
#  price        :integer
#  location     :string
#  order_time   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  custome_name :string
#

class Order < ActiveRecord::Base

	def self.add_fake_orders
		while true do
			sleep(3 + rand(7))
			Order.create(dish_name: Faker::Food.dish, quantity: rand(4) + 1, price: rand(500) + 10, location: Faker::HarryPotter.location, custome_name: Faker::HarryPotter.character)
		end
	end
end
