require 'spec_helper'

module FlightScrapper

  describe EasyjetResponseParser do
    describe '#parse_availability' do

      it 'parses a RoundTrip results page' do
        results_page = Mechanize.new.get("file:///" + File.dirname(__FILE__) + "/html/easyjet_round_trip.html")
        EasyjetResponseParser.parse_availability(results_page)
      end
      
    end
  end
end
