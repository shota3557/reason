class Task < ApplicationRecord
  mount_uploader :picture, TaskPictureUploader
  belongs_to :user
  has_many :causes, dependent: :destroy
end
