class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  acts_as_votable
  validates :rating, presence: true
end
