class Renting < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  validates :total_price, :start, :end, presence: true

  validate :check_start_date

  def check_start_date
    if self.end < self.start
      errors.add(:end, "Sorry, date is wrong")
    end
  end
end
