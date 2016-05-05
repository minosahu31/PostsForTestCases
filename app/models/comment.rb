class Comment < ActiveRecord::Base
  validates :description, presence: true
  validates :description, length: { minimum: 20 }
  belongs_to :post
end
