class ChangeMembershipGroupRoleDefault < ActiveRecord::Migration
  def change
  	change_column_default(:memberships, :group_role, "regular")
  end
end
