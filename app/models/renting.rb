class Renting < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  validates :total_price, :start, :end, presence: true

  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if self.end.blank? || self.start.blank?

    if self.end < self.start
      errors.add(:end_date, "must be after the start date")
    end
  end
end
