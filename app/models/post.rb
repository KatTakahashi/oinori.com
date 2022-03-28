class Post < ApplicationRecord
  has_many :post_lol
  
  validates :body, presence: true
end
