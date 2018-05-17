class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :first_name# presence: true
  validates :last_name# presence: true
  validates :address# presence: true, uniqueness: true
  validates :phone_number# presence: true, uniqueness: true

  has_many :pools
  has_many :bookings
end
