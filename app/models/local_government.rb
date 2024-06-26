class LocalGovernment < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notifications, dependent: :destroy
  has_many :stocks, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :population, presence: true, length: { minimum: 1 }
end
