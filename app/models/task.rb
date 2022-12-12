class Task < ApplicationRecord
  mount_uploader :picture, TaskPictureUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :causes, dependent: :destroy
  accepts_nested_attributes_for :causes, reject_if: :all_blank, allow_destroy: true
  has_many :favorite_users, through: :favorites, source: :user
  validates :name, presence: true
  validates_associated :causes
end
