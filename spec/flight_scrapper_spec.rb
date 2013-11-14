require 'spec_helper'

describe FlightScrapper do
	
	it '#get_suppliers should provide U2 supplier' do

		@available_suppliers = FlightScrapper.get_suppliers
		@available_suppliers.should be_a Hash
		@available_suppliers.should have_key 'U2'
		
	end

end