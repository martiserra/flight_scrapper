class SearchCriteria
	
	attr_reader :origin, :destination, :outbound_date, :inbound_date, :adults, :childs, :infants

	def initialize origin, destination, outbound_date, inbound_date, adults, childs, infants
		@origin = origin
		@destination = destination
		@outbound_date = outbound_date
		@inbound_date = inbound_date
		@adults = adults
		@childs = childs
		@infants = infants
	end

	def is_one_way?
		@inbound_date.nil?
	end
	
end
