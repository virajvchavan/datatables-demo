class User < ActiveRecord::Base

	def self.import_users_from_json
		users = JSON.parse(File.read(Rails.root.join('config/users.json')))['data']
		users.each do |user|
			User.create(:name => user['name'], :position => user['position'], :salary => user['salary'].gsub(',', '')[1..100], :office => user['office'], :start_date => Date.parse(user['start_date']['display']), :extn => user['extn'])
		end
	end
end
