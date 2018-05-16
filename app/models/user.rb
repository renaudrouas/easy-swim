class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :First_Name, presence: true
  validates :Last_Name, presence: true
  validates :Address, presence: true, uniqueness: true
  validates :Phone_Number, presence: true, uniqueness: true

  has_many :pools
  has_many :bookings
end
