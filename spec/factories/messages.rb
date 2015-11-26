FactoryGirl.define do
  factory :message do
  	title "Wild things happen"
    description "This is something awesome!"
    date "01/12/2015"
    end_time "4 am"
    start_time "5 pm"
    skill "Photography"
    userskill "Photographer"
    location "New York"
    budget 500

		sender_id 1
  end
end