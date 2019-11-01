class Renting < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  validates :total_price, :start, :end, presence: true

  validate :end_date_after_start_date

  private
  def end_date_after_start_date
    return if end.blank? || start.blank?

    if end < start
      errors.add(:end, "must be after the start date")
    end
  end

 end
