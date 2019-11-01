class Dog < ApplicationRecord
  belongs_to :user
  validates :name, :age, :breed, :price, :location, presence: true
  mount_uploader :image, ImageUploader
end
