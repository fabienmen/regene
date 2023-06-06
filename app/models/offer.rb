class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :land
  belongs_to :earning
end
