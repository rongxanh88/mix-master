FactoryGirl.define do
  factory :playlist do
    
  end
  
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