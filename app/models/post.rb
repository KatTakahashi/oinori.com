class Post < ApplicationRecord

  before_save :trim

  has_many :lols, dependent: :destroy
  validates :body, presence: true

  private
    # メソッド：投稿文の改行を削除
    def trim
      body.strip!
    end
end
