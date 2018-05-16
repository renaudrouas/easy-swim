class Pool < ApplicationRecord
validates :address, presence: true, uniqueness: true
validates :description, presence: true
validates :price, presence: true
validates :title, presence: true
validates :dimensions, presence:true
has_many :bookings
belongs_to :user
end
