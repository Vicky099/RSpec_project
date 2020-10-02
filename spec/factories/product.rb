FactoryBot.define do
 	factory :product do
 		name {Faker::Lorem.word}
 		cost {Faker::Number.number(digits: 5)}
 		made_in {Faker::Lorem.word}
 		mfg_date {Time.new}
 		expiry_date {Time.new}
 	end 
end	