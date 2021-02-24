class Report < ApplicationRecord
  belongs_to :violator, class_name: 'User'
  belongs_to :reporter, class_name: 'User'

  validates :violator_id, presence: true
  validates :reporter_id, presence: true
end
