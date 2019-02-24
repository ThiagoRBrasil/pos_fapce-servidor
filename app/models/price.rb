class Price < ApplicationRecord
	def nil_fields?
		self.name.nil? || self.number.nil?
	end
end
