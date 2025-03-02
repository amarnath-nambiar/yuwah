class College < ApplicationRecord
  has_many :courses, dependent: :destroy
  has_one_attached :profile_background_image
  has_one_attached :logo

end
