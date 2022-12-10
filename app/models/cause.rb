class Cause < ApplicationRecord
  mount_uploader :picture, CausePictureUploader
  mount_uploader :movie, CauseMovieUploader
  has_many :solutions
  belongs_to :task
end
