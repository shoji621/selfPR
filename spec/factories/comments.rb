FactoryBot.define do
  factory :comment do
    text           {"hello!"}
    user
    post_id        {1}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end