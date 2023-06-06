class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :land
  belongs_to :earning

  # has_one :credit_per_ha, through: :earning
  # has_one :carbon_credit_price, through: :earning
end
