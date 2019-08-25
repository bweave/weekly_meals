class Meal < ApplicationRecord
  belongs_to :user

  has_rich_text :description
  has_one_attached :header_image
end
