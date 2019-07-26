FactoryBot.define do
  factory :user do
    sequence(:email){Faker::Internet.email}
    name "Testuser"
    password "123123"
    password_confirmation "123123"

    trait :invalid_email do
      email {Faker::Name.name}
    end

    trait :admin do
      admin true
    end

    trait :user do
      admin false
    end
  end
end
