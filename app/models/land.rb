class Land < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # validates :registration_number, uniqueness: true
  validates :total_area, presence: true
end
