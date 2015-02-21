FactoryGirl.define do
  factory :address, :class => Hash do

    address_1 { Faker::Address.street_address }
    address_2 nil
    city { Faker::Address.city }
    country { Faker::Address.country }
    country_name { Faker::Address.country }
    latitude  { Faker::Address.latitude }
    longitude { Faker::Address.latitude }
    postal_code { Faker::Address.postcode }
    region { Faker::Address.state_abbr }

    initialize_with { attributes }
  end

  factory :addresses, :class => Hash do
    home nil
    ship nil
    work nil

    [:home, :ship, :work].each do |address_name|
      trait address_name do
        home { build :address }
      end
    end

    factory :home_addresses, traits: [:home]
    factory :ship_addresses, traits: [:ship]
    factory :work_addresses, traits: [:work]
    factory :all_addresses,  traits: [:home, :ship, :work]

    initialize_with { attributes }
  end
end
