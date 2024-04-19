class LocalGovernment < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :local_gov_stock_relations, dependent: :destroy
  has_many :stocks, through: :local_gov_stock_relations
  has_many :notifications, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
end
