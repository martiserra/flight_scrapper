module FlightScrapper

  class FlightSegment
    attr_reader :origin, :destination, :departure_date, :arrival_date, :price, :currency 

    def initialize origin, destination, departure_date, arrival_date, price, currency
      @origin = origin
      @destination = destination
      @departure_date = departure_date
      @arrival_date = arrival_date
      @price = price
      @currency = currency
    end

    def to_s
      segment_string = "FlightSegment {\n"
      segment_string += " - origin: " + @origin + "\n"
      segment_string += " - destination: " + @destination + "\n"
      segment_string += " - departure_date: " + @departure_date.to_s + "\n"
      segment_string += " - arrival_date: " + @arrival_date.to_s + "\n"
      segment_string += " - price: " + @price.to_s + "\n"
      segment_string += " - currency: " + @currency + "\n"
      segment_string += "}" + "\n"
      return segment_string
    end

  end

end