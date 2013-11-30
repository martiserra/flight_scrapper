require_relative '../search_criteria'

module FlightScrapper

  class EasyjetRequestBuilder

    BASE_URL = 'http://www.easyjet.com/links.mvc?'

    def self.build_url search_criteria
      url = BASE_URL
      url += 'dep=' + search_criteria.origin
      url += '&dest=' + search_criteria.destination
      url += '&dd=' + search_criteria.outbound_date.strftime('%d/%m/%Y')
      url += get_return_date(search_criteria)
      url += '&apax=' + search_criteria.adults.to_s
      url += '&pid=www.easyjet.com'
      url += '&cpax=' + search_criteria.childs.to_s
      url += '&ipax=' + search_criteria.infants.to_s
      url += '&lang=EN'
      url += get_is_one_way(search_criteria)
      url += '&searchFrom=SearchPod|/en/'

      url
    end

    def self.get_is_one_way search_criteria
      is_one_way = '&isOneWay='
      is_one_way += search_criteria.is_one_way? ? 'on' : 'off'
      is_one_way
    end

    def self.get_return_date search_criteria
      search_criteria.is_one_way? ? '' : '&rd=' + search_criteria.inbound_date.strftime('%d/%m/%Y')
    end

  end
end
