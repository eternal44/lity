# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  group_role :text             default("Regular")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  def setup
    @membership = memberships(:admin)
  end

  test "should include user_id" do
    @membership.user_id = nil
    assert_not @membership.valid?
  end

  test "should include group_id" do
    @membership.group_id = nil
    assert_not @membership.valid?
  end

  test "should either be Admin or Regular" do
    @membership.group_role = "Handy"
    assert_not @membership.valid?
  end

  test "should filter admin users" do
    assert memberships(:admin).admin?
  end

  test "should filter regular users" do
    assert memberships(:regular).regular?
  end

  test "should filter admin users as regular users as well" do
    assert memberships(:admin).regular?
  end

end
