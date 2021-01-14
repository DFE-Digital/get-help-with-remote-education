FactoryBot.define do
  factory :answer do
    
    trait :duplicate_answer do
      reference_code { "code" }
    end
    
  end
end