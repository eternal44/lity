class ChangeDefaultGroupRole < ActiveRecord::Migration
  def change
		change_column_default :memberships, :group_role, 'Regular'
  end
end
