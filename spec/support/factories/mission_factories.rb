# spec/support/factories/mission_factories.rb

FactoryGirl.define do
  factory :mission do
    user { build_stubbed :user }

    sequence(:name) { |index| "Nyx #{index}" }
  end # factory
end # define
