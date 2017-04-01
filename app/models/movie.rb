class Movie < ApplicationRecord

  belongs_to :user
  has_many :reviews

  acts_as_votable

  has_attached_file :image, styles: { medium: "250x350#", small: "200x250>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_attached_file :cover, styles: { medium: "1440x950#"}
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  def self.search(search)
    if search
      where([" title LIKE ?","%#{search}%"])
    else
      all
    end
  end
end
