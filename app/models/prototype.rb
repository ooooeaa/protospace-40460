class Prototype < ApplicationRecord
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true

  belongs_to :user, optional: true
  has_one_attached :image
  has_many :comments
 
end
