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
end
