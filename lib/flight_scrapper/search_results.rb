module FlightScrapper

  class SearchResults
    attr_reader :outbound_segments, :inbound_segments

    def initialize(outbound_segments, inbound_segments = nil)
      @outbound_segments = outbound_segments
      @inbound_segments = inbound_segments
    end

    def is_one_way?
      @inbound_segments.nil?
    end

  end
end
