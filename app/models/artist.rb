class Artist < ApplicationRecord
  validates :name, :image_path, presence: true
  validates :name, uniqueness: true
end
