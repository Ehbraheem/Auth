# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { Faker::Job.position }
    description { Faker::Lorem.paragraphs }
    uuid { Faker::Internet.uuid }

    trait :with_parent do
      parent { association self }
    end
  end
end
