class Pool < ApplicationRecord

 geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

mount_uploader :photo, PhotoUploader

# validates :address, presence: true #uniqueness: true
# validates :description #presence: true
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
