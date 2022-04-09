class AsksController < ApplicationController
  # ---------- 逆質問一覧ページ ----------
  def index
    @ask = Ask.new
    @asks = Ask.all
  end

  # ---------- 投稿機能 ----------
  def create
    @ask = Ask.new(post_params)
    @ask.ip = poster_ip
    if @ask.save
      redirect_to request.referer
    else
      @ask = Ask.new(post_params)
      @asks = Ask.all
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
end
