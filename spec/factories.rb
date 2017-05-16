FactoryGirl.define do
  factory :song do
    factory :song do
      title "A New Hope"
    end

    sequence :title do |n|
      "Song#{n}"
    end
  end
  
  factory :artist do
    factory :artist do
      name "Bob Marley"
      image_path "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    end

    sequence :name do |n|
      "Person#{n}"
    end

    sequence :image_path do |n|
      "http://www.image#{n}.com"
    end
  end
end