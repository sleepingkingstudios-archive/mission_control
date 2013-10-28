# spec/support/factories/user_factories.rb

FactoryGirl.define do
  sequence :user_email do |index|
    "user_#{index}@example.com"
  end # sequence

  factory :user do
    email { generate :user_email }
    password 'password'
  end # factory

  factory :admin, :parent => :user do
    role 'admin'
  end # factory
end # define
