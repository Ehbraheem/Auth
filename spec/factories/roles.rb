# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { Faker::Job.position }
    description { Faker::Lorem.paragraph }
    uuid { Faker::Internet.uuid }

    trait :with_parent do
      association :parent, factory: :role, strategy: :create
    end
  end
end
