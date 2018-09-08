# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :string
#  salary     :integer
#  office     :string
#  start_date :date
#  extn       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base

	def self.import_users_from_json
		users = JSON.parse(File.read(Rails.root.join('config/users.json')))['data']
		users.each do |user|
			User.create(:name => user['name'], :position => user['position'], :salary => user['salary'].gsub(',', '')[1..100], :office => user['office'], :start_date => Date.parse(user['start_date']['display']), :extn => user['extn'])
		end
	end

end
