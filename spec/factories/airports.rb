FactoryBot.define do
  factory :airport do
    sequence(:code) { |n| "#{n.to_s.rjust(3, "0")}" }
    terminals { 1 }
    name { "Test Airport" }
    city { "Test City" }
    country { "Test Country" }
  end
end
