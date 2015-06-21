class ArchivePolicy < ApplicationPolicy
	def create?
		true
	end

	def update?
		# user.present? && user == archive.user
		true
	end

	def destroy?
		user.present? && user == archive.user
	end	

	private
		def archive
			record
		end
end
