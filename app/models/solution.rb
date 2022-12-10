class Solution < ApplicationRecord
  mount_uploader :picture, SolutionPictureUploader
  belongs_to :cause
end
