# == Schema Information
#
# Table name: sponsors
#
#  id                     :integer          not null, primary key
#  company_name           :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_sponsors_on_email                 (email) UNIQUE
#  index_sponsors_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'test_helper'

class SponsorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
