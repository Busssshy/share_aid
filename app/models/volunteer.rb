class Volunteer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :vol_local_gov_relations, dependent: :destroy
  has_many :local_governments, through: :vol_local_gov_relations
  has_many :reservation_confirmations, dependent: :destroy
  has_many :stocks, through: :reservation_confirmations
  has_many :reservations, dependent: :destroy
end
