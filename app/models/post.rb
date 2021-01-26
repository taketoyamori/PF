class Post < ApplicationRecord
  belongs_to :admin

  attachment :post_image

  validates :post_image, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
