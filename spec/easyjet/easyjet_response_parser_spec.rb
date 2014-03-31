require 'spec_helper'

module FlightScrapper

  describe EasyjetResponseParser do
    describe '#parse_availability' do

      it 'parses a RoundTrip results page' do
        results_page = Mechanize.new.get("file:///" + File.dirname(__FILE__) + "/html/easyjet_round_trip.html")
        search_results = EasyjetResponseParser.parse_availability(results_page)
        # results number
        search_results.outbound_segments.size.should eql 4
        search_results.inbound_segments.size.should eql 6
        # results prices
        search_results.outbound_segments.collect{ |segment| segment.price }.should =~ [24.99, 23.99, 22.99, 77.99]
        search_results.inbound_segments.collect{ |segment| segment.price }.should =~ [58.51, 51.51, 124.51, 80.51, 124.51, 124.51]
        # locations
        search_results.outbound_segments.each{ |segment|
          segment.origin.should eql 'BCN'
          segment.destination.should eql 'LTN'
        }
        search_results.inbound_segments.each{ |segment|
          segment.origin.should eql 'LTN'
          segment.destination.should eql 'BCN'
        }
        # dates
        # TODO
      end
      
    end
  end
end
