FactoryBot.define do
   factory :comment do
      content {Faker::Lorem.characters Settings.factories.comment.content}
   end
end
