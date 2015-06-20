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

require 'test_helper'

class ArchiveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
