FactoryBot.define do
  factory :excavator do
    sequence(:company_name) { |i| "Company #{i}" }
    sequence(:full_address) { |i| "Address #{i}" }
    crew_onsite { false }
    ticket
  end
end
