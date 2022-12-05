class Task < ApplicationRecord
  belongs_to :user
  has_many :causes
end
