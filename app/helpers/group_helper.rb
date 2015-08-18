module GroupHelper
	def admin(group)
		true if group.memberships.admin.where(user_id: current_user.id).present?
	end

	def regular(group)
		true if group.memberships.member.where(user_id: current_user.id).present?
	end
end
