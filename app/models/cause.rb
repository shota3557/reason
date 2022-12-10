class Cause < ApplicationRecord
  mount_uploader :picture, CausePictureUploader
  mount_uploader :movie, CauseMovieUploader
  has_many :solutions
  accepts_nested_attributes_for :solutions, reject_if: :all_blank, allow_destroy: true
  belongs_to :task
end
