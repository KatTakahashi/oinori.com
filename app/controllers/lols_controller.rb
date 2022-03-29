class LolsController < ApplicationController
    # ---------- lol(いいね)機能 ----------
  def create
    @lol = Lol.new(post_id: params[:post_id])
    @lol.save
    redirect_to request.referer
  end
end
