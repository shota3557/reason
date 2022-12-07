class Cause < ApplicationRecord
  mount_uploader :picture, CausePictureUploader
  mount_uploader :movie, CauseMovieUploader
  belongs_to :task
end
