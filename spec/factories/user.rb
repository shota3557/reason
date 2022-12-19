FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "test1#{n}@example.com" }
    password { 'testtest' }
    password_confirmation { 'testtest' }
    admin { 'true' }
    end 

  factory :second_user, class: User do
    sequence(:name) { |n| "user1#{n}" }
    sequence(:email) { |n| "test#{n}@example2.com" }
    password { 'testtest' }
    password_confirmation { 'testtest' }
    admin { 'false' }
  end 
end