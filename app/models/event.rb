class Event < ApplicationRecord

  belongs_to :user
  belongs_to :prefecture
  has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

  attachment :event_image

  validates :prefecture_id, presence: true
  validates :title, presence: true
  validates :introduction, presence: true
  validates :date, presence: true

end
