FactoryBot.define do
  factory :airport do
    sequence(:code) { |n| "AIR#{n.to_s.rjust(3, "0")}" }
    terminals { 1 }
    name { "Test Airport" }
  end
end
