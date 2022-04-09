class GoodsController < ApplicationController
  # ---------- lol(いいね)機能 ----------
  def create
    @ask = Ask.find(params[:ask_id])
    # unless @ask.ip == request.ip
      good = Good.new(ask_id: @ask.id)
      good.save
    # end
  end
end
