require 'mechanize'
require_relative 'easyjet_request_builder'
require_relative 'easyjet_response_parser'

module FlightScrapper

  class EasyjetSupplier

    def search search_criteria
      agent = Mechanize.new { |agent|
        agent.user_agent_alias = 'Mac Safari'
      }

      results_page = agent.get(EasyjetRequestBuilder.build_url search_criteria)
    end
    
  end

end
