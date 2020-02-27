class Movie < ApplicationRecord

  mount_uploader :image, ImagesUploader
  
  has_many :reviews
  has_many :users, through: :reviews

  validates :title, :director, :image, presence: true

  def self.search(search)
    if search
      Movie.where(['title LIKE(?) or director LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      Movie.all
    end
  end
  
end
