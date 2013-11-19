module FlightScrapper

	class EasyjetRequestBuilder

		BASE_URL = 'http://www.easyjet.com/links.mvc?'

		def self.build_url search_criteria
			url = BASE_URL
			url += 'dep=' + search_criteria.origin
			url += '&dest=' + search_criteria.destination
			url += '&dd=' + search_criteria.outbound_date.strftime('%d/%m/%Y')
			url += '&rd=' + search_criteria.inbound_date.strftime('%d/%m/%Y')
			url += '&apax=' + search_criteria.adults
			url += '&pid=www.easyjet.com'
			url += '&cpax=' + search_criteria.childs
			url += '&ipax=' + search_criteria.infants
			url += '&lang=EN'
			url += '&isOneWay=off'
			url += '&searchFrom=SearchPod|/en'

			url
		end

	end
end
