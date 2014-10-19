# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    role "MyString"
    wiki_id nil
    user_id nil
  end
end
