class Cause < ApplicationRecord
  mount_uploader :picture, CausePictureUploader
  belongs_to :task
end
