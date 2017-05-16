class Artist < ApplicationRecord
  has_many :songs

  validates :name, :image_path, presence: true
  validates :name, uniqueness: true
end
