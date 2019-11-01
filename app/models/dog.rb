class Dog < ApplicationRecord
  belongs_to :user
  validates :name, :age, :breed, :price, :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  mount_uploader :image, ImageUploader

end
