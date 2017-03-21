class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :movies
  has_attached_file :image, styles: { medium: "200x350>", small: "300x250>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
