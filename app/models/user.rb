class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  #通報機能アソシエーション
  #違反者側
  has_many :violator_relationships, class_name:"Relationship", foreign_key: :violator_id, dependent: :destroy
  has_many :violators, through: :violator_relationships, source: :violator
  #通報者側
  has_many :reporter_relationships, class_name:"Relationship", foreign_key: :reporter_id, dependent: :destroy
  has_many :reporters, through: :passive_relationships, source: :reporter

  attachment :profile_image

  validates :name, length: {maximum: 20, minimum: 1}
  validates :age, presence: true, numericality: { only_integer: true }

  def reported_by?(user)
    violator_relationships.find_by(reporter_id: user.id).present?
  end

end
