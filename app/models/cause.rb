class Cause < ApplicationRecord
  mount_uploader :picture, CausePictureUploader
  mount_uploader :movie, CauseMovieUploader
  has_many :solutions, dependent: :destroy
  accepts_nested_attributes_for :solutions,  allow_destroy: true
  belongs_to :task
  validates :content, presence: true
end
