FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password123' }
    role { :parcel_owner }

    # You can define additional attributes as needed

    trait :train_operator do
      role { :train_operator }
    end

    trait :post_master do
      role { :post_master }
    end
  end
end

FactoryBot.define do
  factory :parcel do
    weight { 10 } # Example weight value
    volume { 100 } # Example volume value
    user # This will associate a user with the parcel
    train # This will associate a train with the parcel (optional)

    # Define any other attributes and associations you need for the parcel factory
  end
end

FactoryBot.define do
  factory :line do
    # Define factory attributes
    status { :available }
    
    # Define any other attributes you need for the line factory
  end
end

FactoryBot.define do
  factory :train do
    name { "Train 1" } # Example name value
    total_weight { 100 } # Example total weight value
    total_volume { 200 } # Example total volume value
    cost { 500 } # Example cost value
    status { :available } # Example status value
    
    association :user, factory: :user # This will associate a user with the train

    # Define any other attributes and associations you need for the train factory
  end
end

FactoryBot.define do
  factory :train_line do
    association :train
    association :line
  end
end
