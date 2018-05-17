class Pool < ApplicationRecord
validates :address, presence: true, uniqueness: true
validates :description, presence: true
validates :price, presence: true
validates :title, presence: true
validates :dimensions, presence:true
has_many :bookings
belongs_to :user

include PgSearch
  pg_search_scope :search_by_title_and_address_and_description,
    against: [ :title, :description, :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
