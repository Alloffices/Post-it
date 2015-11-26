class Search < ActiveRecord::Base
	def search_projxes

	   projxes = Projx.all

	   projxes = projxes.where("type_skill like ?", type_skill) if type_skill.present?
	   projxes = projxes.where("location >= ?", location) if location.present?

	   return projxes
	end
end
