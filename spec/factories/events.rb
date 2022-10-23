# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    number { rand(100) }
    action { 'created' }
    issue_url { 'http://xyz.com/issue' }
  end
end
