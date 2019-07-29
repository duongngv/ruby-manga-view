FactoryBot.define do
  factory :comic do
    name {Faker::Name.name}
    author {Faker::Name.name}
    description {Faker::Lorem.characters Settings.factories.comic.description}
    publish_date {Date.today}
    association :category
  end
end
