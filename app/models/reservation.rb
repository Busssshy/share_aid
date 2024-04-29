class Reservation < ApplicationRecord
  has_many :reservation_details
  belongs_to :volunteer
end
