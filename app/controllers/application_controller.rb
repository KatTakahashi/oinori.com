class ApplicationController < ActionController::Base
  include SessionsHelper
  
  # 投稿者のIPアドレス取得
  def poster_ip
    request.ip
  end
  
  # ヘッダーへの新着案内用
  def latest_post
    @latest_post = Post.preload(:lols).order(created_at: :desc).first
    @latest_ask = Ask.preload(:goods).order(created_at: :desc).first
  end
end
