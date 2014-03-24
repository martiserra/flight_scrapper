class SearchCriteria
  
  attr_reader :origin, :destination, :outbound_date, :inbound_date, :adults, :childs, :infants

  def initialize origin, destination, outbound_date, inbound_date
    @origin = origin
    @destination = destination
    @outbound_date = outbound_date
    @inbound_date = inbound_date
    @adults = 1
    @childs = 0
    @infants = 0
  end

  def is_one_way?
    @inbound_date.nil?
  end
  
end
