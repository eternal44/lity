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

class Membership < ActiveRecord::Base
	belongs_to :user
	belongs_to :group

	scope :admin, -> { where(group_role: 'Admin') }
	scope :member, -> {where(group_role: 'Admin' || 'Regular' )}

end
