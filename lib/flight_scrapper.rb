require "flight_scrapper/version"
require "flight_scrapper/easyjet/easyjet_supplier"

module FlightScrapper

	SUPPLIERS = { 'U2' => EasyjetSupplier.new }
	
	module_function

	def get_suppliers
		SUPPLIERS
	end
	
end