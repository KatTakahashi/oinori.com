class AsksController < ApplicationController
  # ---------- 逆質問一覧ページ ----------
  def index
    @ask = Ask.new
    latest_post
    asks_all_with_sort
    Visiter.create(ip: request.ip)
  end

  # ---------- 投稿機能 ----------
  def create
    @ask = Ask.new(ask_params)
    @ask.ip = poster_ip
    if @ask.save
      Good.create(ask_id: @ask.id)
      redirect_to request.referer
    else
      @ask = Ask.new(ask_params)
      asks_all_with_sort
      render 'index'
    end
  end

  # ---------- 削除機能 ----------
  def destroy
    ask = Ask.find(params[:id])
    if logged_in? || ask.ip == poster_ip
      ask.destroy
    end
    redirect_to request.referer
  end

  private
  # --------------- ストロングパラメータ --------------
  def ask_params
    params.require(:ask).permit(:body)
  end

  # 投稿者のIPアドレス取得
  def poster_ip
    request.ip
  end

  # 全投稿取得(N+1対策済み)
  def asks_all
    Ask.preload(:goods)
  end

  # ソート用投稿一覧
  def asks_all_with_sort
    if params[:latest]
      @asks = asks_all.order(created_at: :desc)
    elsif params[:old]
      @asks = asks_all.order(created_at: :asc)
    elsif params[:good]
      @asks = asks_all.find(Good.group(:ask_id).order('count(ask_id) desc').pluck(:ask_id))
    else
      @asks = asks_all.order(created_at: :desc)
    end
  end

  def latest_post
    @latest_post = Post.preload(:lols).order(created_at: :desc).first
  end
end
