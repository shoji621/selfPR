FactoryBot.define do
  factory :post do
    industry_id    {1}
    hopejob_id     {1}
    nowjob_id      {1}
    text           {"hello!"}
    solved         {0}
    user
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end