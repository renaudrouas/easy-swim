class Pool < ApplicationRecord
 geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
validates :address, presence: true, uniqueness: true
validates :description, presence: true
validates :price, presence: true
validates :title, presence: true
validates :dimensions, presence:true
has_many :bookings
belongs_to :user
end
