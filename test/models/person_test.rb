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

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
