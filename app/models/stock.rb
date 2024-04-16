class Stock < ApplicationRecord
  has_many :reservation_confirmations, dependent: :destroy
  has_many :volunteers, through: :reservation_confirmations
  has_many :reservation_details, dependent: :destroy
  has_many :reservations, through: :reservation_details
  has_many :local_gov_stock_relations, dependent: :destroy
  has_many :local_governments, through: :local_gov_stock_relations
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :name, presence: true, length: { in: 1..20 }
  validates :amount, presence: true
  validates :one_daily_quantity, presence: true
  validates :deadline, presence: true
  validates :memo, length: { maximum: 200 }
end
