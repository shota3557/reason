class Cause < ApplicationRecord
  mount_uploader :picture, CausePictureUploader
  mount_uploader :movie, CauseMovieUploader
  accepts_nested_attributes_for :solutions, reject_if: :all_blank, allow_destroy: true
  has_many :solutions
  belongs_to :task
end
