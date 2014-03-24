FactoryGirl.define do
  factory :search_criteria do
    
    trait :round_trip_one_adult do
      ignore do
        origin 'BCN'
        destination 'LTN'
        outbound_date Date.new(2014,1,18) 
        inbound_date Date.new(2014,4,4) 
      end

      initialize_with { SearchCriteria.new(origin, destination, outbound_date, inbound_date) }
    end

    trait :one_way_one_adult do
      ignore do
        origin 'BCN'
        destination 'LTN'
        outbound_date Date.new(2014,1,18) 
        inbound_date nil
      end

      initialize_with { SearchCriteria.new(origin, destination, outbound_date, inbound_date) }
    end
  
  end
end