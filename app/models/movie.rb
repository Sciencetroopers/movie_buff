class Movie < ApplicationRecord

  belongs_to :user

  has_attached_file :image, styles: { medium: "200x350>", small: "300x250>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.search(search)
    if search
      where([" title LIKE ?","%#{search}%"])
    else
      all
    end
  end
end
