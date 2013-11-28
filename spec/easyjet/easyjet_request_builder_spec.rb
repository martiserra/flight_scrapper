require 'spec_helper'

module FlightScrapper

	describe EasyjetRequestBuilder do
		describe '#build_url' do
			
			it 'builds the RoundTrip URL' do
				criteria = FactoryGirl.build(:search_criteria, :round_trip_one_adult)
				EasyjetRequestBuilder.build_url(criteria).should eql 'http://www.easyjet.com/links.mvc?dep=BCN&dest=LTN&dd=18/01/2014&rd=04/04/2014&apax=1&pid=www.easyjet.com&cpax=0&ipax=0&lang=EN&isOneWay=off&searchFrom=SearchPod|/en/'
			end

			it 'builds the OneWay URL' do
				criteria = FactoryGirl.build(:search_criteria, :one_way_all_passenger_types)
				EasyjetRequestBuilder.build_url(criteria).should eql 'http://www.easyjet.com/links.mvc?dep=BCN&dest=LTN&dd=18/01/2014&apax=1&pid=www.easyjet.com&cpax=1&ipax=1&lang=EN&isOneWay=on&searchFrom=SearchPod|/en/'
			end
		
		end
	end

end
