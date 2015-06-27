# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  group_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships

	has_many :archives

	accepts_nested_attributes_for :archives
	accepts_nested_attributes_for :memberships

	validates_associated :archives
	validates :group_name, presence: true

end
