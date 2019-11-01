class Dog < ApplicationRecord
  has_many :rentings
  belongs_to :user
  validates :name, :age, :breed, :price, :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  mount_uploader :image, ImageUploader

  def unavailable_dates
    rentings.pluck(:start, :end).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
