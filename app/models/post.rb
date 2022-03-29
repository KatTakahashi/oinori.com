class Post < ApplicationRecord
  has_many :lols, dependent: :destroy
  
  validates :body, presence: true
end
