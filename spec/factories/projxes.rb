FactoryGirl.define do
  factory :projx do
    title 'Example'
    description 'this is something'
    type_skill 'photographer'
    location 'nyc'
    website 'www.googe.com'
    date '02/02/2015'
    stime '3 AM'
    etime '4 am'
    budget 500
    user_id 1
  end
end

# Projx id: nil, title: "Example", description: nil, user_id: nil, created_at: nil, updated_at: nil, type_skill: nil, location: nil, website: nil, date: nil, stime: nil, etime: nil, budget: nil>.valid?` to return true, got false