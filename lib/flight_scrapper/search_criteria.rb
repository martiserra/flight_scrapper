class SearchCriteria
	
	attr_reader :origin, :destination, :outbound_date, :inbound_date

	def initialize origin, destination, outbound_date, inbound_date
		@origin = origin
		@destination = destination
		@outbound_date = outbound_date
		@inbound_date = inbound_date
	end
	
end
