class Reservation < ApplicationRecord
  has_many :reservation_details, dependent: :destroy
  has_many :stocks, through: :reservation_details
  belongs_to :volunteer
end
