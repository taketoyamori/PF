class Event < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  scope :search, -> (search_params) do
    return if search_params.blank?

    date(search_params[:date]).
      prefecture_id_is(search_params[:prefecture_id])
  end

  scope :date, -> (date) { where(date: date) if date.present? }
  scope :prefecture_id_is, -> (prefecture_id) { where(prefecture_id: prefecture_id) if prefecture_id.present? }

  attachment :event_image

  validates :prefecture_id, presence: true
  validates :title, presence: true
  validates :event_image, presence: true
  validates :introduction, presence: true
  validates :date, presence: true
end
