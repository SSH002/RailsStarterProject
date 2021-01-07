FactoryBot.define do
  factory :account do
    login { 'ADSL' }
    password { '1' }
    mana { 1 }
    happiens { 1 }
    fatigue { 1 }
    money { 1 }
    wins { 1 }
    defeates { 1 }
  end
end
