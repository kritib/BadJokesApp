FactoryGirl.define do
  factory :user do
    username "Fooser"
  end

  factory :joke do
    body "What is the what?"
    user_id 1
  end
end