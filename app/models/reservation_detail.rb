class ReservationDetail < ApplicationRecord
  belongs_to :stock
  belongs_to :reservation
end