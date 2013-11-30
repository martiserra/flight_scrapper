require 'spec_helper'

describe FlightScrapper do
  
  before :all do
    @available_suppliers = FlightScrapper.get_suppliers
  end

  it '#get_suppliers should provide U2 supplier' do

    @available_suppliers.should be_a Hash
    @available_suppliers.should have_key 'U2'

  end

  it 'every supplier should respond_to #search' do
    
    @available_suppliers.each_value { |supplier|
      supplier.should respond_to :search
    }
  
  end

end