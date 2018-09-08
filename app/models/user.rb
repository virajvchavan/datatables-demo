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
#  extn       :string # position_order
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base

	# def self.import_users_from_json
	# 	users = JSON.parse(File.read(Rails.root.join('config/users.json')))['data']
	# 	users.each do |user|
	# 		User.create(:name => user['name'], :position => user['position'], :salary => user['salary'].gsub(',', '')[1..100], :office => user['office'], :start_date => Date.parse(user['start_date']['display']), :extn => user['extn'])
	# 	end
	# end

	# def self.set_posistion_orders
	# 	position_orders = {"System Architect"=>4, "Accountant"=>6, "Junior Technical Author"=>7, "Senior Javascript Developer"=>4, "Integration Specialist"=>5, "Sales Assistant"=>7, "Javascript Developer"=>5, "Software Engineer"=>5, "Office Manager"=>5, "Support Lead"=>6, "Regional Director"=>4, "Senior Marketing Designer"=>4, "Marketing Designer"=>4, "Chief Financial Officer (CFO)"=>2, "Systems Administrator"=>4, "Personnel Lead"=>6, "Development Lead"=>4, "Chief Marketing Officer (CMO)"=>2, "Pre-Sales Support"=>6, "Chief Executive Officer (CEO)"=>1, "Developer"=>5, "Chief Operating Officer (COO)"=>2, "Regional Marketing"=>3, "Technical Author"=>5, "Team Leader"=>4, "Post-Sales support"=>7, "Secretary"=>3, "Financial Controller"=>5, "Director"=>1, "Support Engineer"=>6, "Data Coordinator"=>6, "Junior Javascript Developer"=>7, "Customer Support"=>9}
	# 	User.all.each do |user|
	# 		user.update(extn: position_orders[user.position])
	# 	end
	# end

	def as_json(*)
    super.except("created_at", "updated_at").tap do |hash|
      hash['position'] = { name: hash['position'], order: hash['extn'] }
      hash['start_date'] = { display: self.start_date.strftime('%B %d, \'%y'), order: self.start_date.to_time.to_i }
    end
  end

end
