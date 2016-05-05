class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 20 }
  has_many :comments
end
