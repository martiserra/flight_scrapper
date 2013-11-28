FactoryGirl.define do
  factory :search_criteria do
    
    trait :round_trip_one_adult do
      ignore do
        origin 'BCN'
        destination 'LTN'
        outbound_date Date.new(2014,1,18) 
        inbound_date Date.new(2014,4,4) 
        adults 1
        childs 0
        infants 0
      end

      initialize_with { SearchCriteria.new(origin, destination, outbound_date, inbound_date, adults, childs, infants) }
    end

    trait :one_way_all_passenger_types do
      ignore do
        origin 'BCN'
        destination 'LTN'
        outbound_date Date.new(2014,1,18) 
        inbound_date nil
        adults 1
        childs 1
        infants 1
      end

      initialize_with { SearchCriteria.new(origin, destination, outbound_date, inbound_date, adults, childs, infants) }
    end
  
  end
end