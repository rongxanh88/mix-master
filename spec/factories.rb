FactoryGirl.define do
  factory :song do
    
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