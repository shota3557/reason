class Task < ApplicationRecord
  mount_uploader :picture, TaskPictureUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :causes, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
