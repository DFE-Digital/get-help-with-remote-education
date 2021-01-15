FactoryBot.define do
  factory :answer do

    trait :blank_answer do
      reference_code { SecureRandom.uuid }
    end
    
    trait :duplicate_answer do
      reference_code { "code" }
    end
    
  end
end