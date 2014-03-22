require 'mechanize'
require_relative '../search_criteria'
require_relative '../flight_segment'

module FlightScrapper

  class EasyjetResponseParser

    # xpath expressions
    OUTBOUND = '//div[@id="OutboundFlightDetails"]'
    DAY = '//div[@class="day"]'
    DEPARTURE_DATE = 'input[@class="flightDate"]/@value'
    ARRIVAL_DATE = 'input[@class="flightArrivalDate"]/@value'
    PRICE = 'a/@charge-debit-full'
    CURRENCY = 'a/@charge-debit'

    # currency map
    CURRENCIES = {
      '€' => 'EUR',
      'CHF' => 'CHF',
      '£' => 'GBP',
      '$' => 'USD',
      'Dkr' => 'DKK',
      'Kc' => 'CZK',
      'Ft' => 'HUF',
      'zl' => 'PLN',
      'Md' => 'MAD'
    }

    def self.parse_availability results_page, search_criteria 
      segments = Array.new
      segment_results = results_page.search(OUTBOUND)[0]
      days = segment_results.xpath(DAY)
      days.each{ |day| 
        origin, destination = parse_locations day
        if ((origin != nil) && (destination != nil)) then 
          segments.concat(parse_flights(day, origin, destination))
        end
      }
      segments.each { |s|
        puts s
      }
    end

    private
    
    def self.parse_flights segment_group, origin, destination
      segments = Array.new
      segment_group.xpath('ul/li').each{ |segment| 

        if (!segment.xpath(PRICE).empty?) then
          price = segment.xpath(PRICE).to_s.to_f
          departure_date = parse_date segment.xpath(DEPARTURE_DATE).to_s
          arrival_date = parse_date segment.xpath(ARRIVAL_DATE).to_s
          currency = parse_currency segment.xpath(CURRENCY).to_s

          segments << FlightSegment.new(origin, destination, departure_date, arrival_date, price, 'EUR')
        end
      }
      return segments
    end

    def self.parse_date date_string
      return Time.at(date_string.delete("^0-9").to_i / 1000) - 3600
    end

    def self.parse_currency currency_string
      currency_char = currency_string[0]
      return CURRENCIES.has_key? currency_char ? CURRENCIES[currency_char] : currency_char
    end

    def self.parse_locations segment_group
      locations = segment_group.xpath('span').first.xpath('@id')[0].to_s
      origin = locations[0..2]
      destination = locations[4..6]
      return origin, destination
    end
  end
end