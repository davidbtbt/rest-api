# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    name { Faker::Address.city }
    state { Faker::Address.state_abbr }
  end

  factory :company do
    name { Faker::Company.name }
    association :city
  end

  factory :person do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    association :city
    association :company
  end
end
