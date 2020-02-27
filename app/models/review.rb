class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :body, :rating, presence: true
  validates_uniqueness_of :movie_id, scope: :user_id
end
