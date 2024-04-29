class Volunteer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservation_confirmations, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :vol_local_gov_relations, dependent: :destroy
  has_many :local_government, through: :vol_local_gov_relations

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :phone_number, presence: true
  validates :post_code, presence: true
  validates :address, presence: true

end
