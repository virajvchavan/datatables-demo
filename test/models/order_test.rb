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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
