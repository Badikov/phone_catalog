class ScreenType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
