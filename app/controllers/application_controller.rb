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

  # アクセス数
  def visiters
    # アクセス集計
    Visiter.create(ip: request.ip)
    # トータルのアクセス数
    @visiters = Visiter.all
    # トータルの利用人数
    @visiters_ip = Visiter.distinct.pluck(:ip)
    # 本日のアクセス数
    @visiters_today =@visiters.where(created_at: Time.zone.now.all_day)
    # 本日の利用人数
    @visiters_today_ip = Visiter.where(created_at: Time.zone.now.all_day).distinct.pluck(:ip)
  end
end
