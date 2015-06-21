class GroupPolicy < ApplicationPolicy
	def index?
		true
	end

	def edit?
		true
	end

	def new?
		true
	end

	def show?
		true
	end
end