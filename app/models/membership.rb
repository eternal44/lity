# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  group_role :string           default("Regular")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Membership < ActiveRecord::Base
	belongs_to :user
	belongs_to :group

  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :group_role, inclusion: { in: %w(Admin Regular),
                                    messge: "%(value) is not a valid membership type" }

  # refactor these scopes out.
	scope :admin, -> { where(group_role: 'Admin') }
	scope :member, -> {where(group_role: 'Admin' || 'Regular' )}

  def admin?    
    group_role == "Admin"
  end

  def regular?    
    group_role == "Admin" || "Regular"
  end



end
