class Movie < ApplicationRecord

  belongs_to :user

  def self.search(search)
    if search
      where([" title LIKE ?","%#{search}%"])
    else
      all
    end
  end
end
