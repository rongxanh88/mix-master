FactoryGirl.define do
  factory :song do
    sequence :title do |n|
      "Song#{n}"
    end
  end
  
  factory :artist do

    sequence :name do |n|
      "Person#{n}"
    end

    sequence :image_path do |n|
      "http://www.image#{n}.com"
    end
  end
end

# activation_code { User.generate_activation_code }
#   date_of_birth   { 21.years.ago }