# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships
	has_many :archives, dependent: :destroy
	has_many :comments, as: :commentable, dependent: :destroy

  validates :group_name, presence: true

  # considering moving these 3 below to dashboard model when refactoring.
  # They don't belong here, right?
  accepts_nested_attributes_for :archives
  accepts_nested_attributes_for :memberships
  validates_associated :archives

end
