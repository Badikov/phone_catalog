class Phone < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  belongs_to :vendor
  belongs_to :case_type
  belongs_to :phone_type
  belongs_to :platform
  belongs_to :screen_type
  belongs_to :touch_screen_type

  def self.by_vendor_url(vendor_url)
    includes(:vendor).where(vendors: {url: vendor_url})
  end
end
