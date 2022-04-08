class Post < ApplicationRecord
　# --------------- コールバック ---------------
  before_save :trim

  # --------------- アソシエーション ---------------
  has_many :lols, dependent: :destroy

  # --------------- バリデーション ---------------
  validates :body, presence: true

  private
    # --------------- メソッド：投稿文の改行を削除 ---------------
    def trim
      body.strip!
    end
end
