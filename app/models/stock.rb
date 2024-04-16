class Stock < ApplicationRecord
  has_many :reservation_confirmations
  has_many :volunteers, through: :reservation_confirmations
  has_many :reservation_details
  has_many :notifications, as: :notifiable, dependent: :destroy
  
  
  validates :name, presence: true, length: { in: 1..20 }
  validates :amount, presence: true
  validates :one_daily_quantity, presence: true
  validates :deadline, presence: true
  validates :memo, length: { maximum: 200 }
end
