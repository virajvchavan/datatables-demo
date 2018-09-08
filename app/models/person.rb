# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  salary     :integer
#  country    :string
#  birth_date :date
#  pincode    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ActiveRecord::Base

	def self.load_fake_data(count)
		count.times do
			Person.create(first_name: Faker::Name.first_name,
			              last_name: Faker::Name.last_name,
			              salary: Faker::Number.number(6),
			              country: Faker::Address.country,
			              birth_date: Faker::Date.birthday(18, 65),
			              pincode: Faker::Address.zip
			              )
		end
	end
end
