class ReservationConfirmation < ApplicationRecord
  belongs_to :stock
  belongs_to :volunteer
end
