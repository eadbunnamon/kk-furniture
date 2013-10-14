FactoryGirl.define do
  sequence(:room_name)      {|n| "room_name#{n}" }
  factory :room do
    name                 { "#{FactoryGirl.generate(:room_name)}"   }
  end
end
