# == Schema Information
#
# Table name: archives
#
#  id          :integer          not null, primary key
#  group_id    :integer
#  user_id     :integer
#  lift_name   :text
#  lift_weight :integer
#  video_link  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Archive < ActiveRecord::Base
	belongs_to :group
	belongs_to :user

	validates :user_id, presence: true
	validates :group_id, presence: true
	validates :lift_name, presence: true
	validates :lift_weight, presence: true
  validates_format_of :video_link, :with => URI::regexp(%w(http https)),
	allow_nil: true

	has_many :comments, as: :commentable
end
