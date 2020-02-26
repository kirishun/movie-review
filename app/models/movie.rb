class Movie < ApplicationRecord

  mount_uploader :image, ImagesUploader
  
  has_many :reviews
  has_many :users, through: :reviews

  validates :title, :director, :image, presence: true
end
