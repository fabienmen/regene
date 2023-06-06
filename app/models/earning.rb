class Earning < ApplicationRecord
  has_one :carbon_credit_price
  has_one :credit_per_ha
end
