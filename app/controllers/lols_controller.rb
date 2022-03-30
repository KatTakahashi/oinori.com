class LolsController < ApplicationController
    # ---------- lol(いいね)機能 ----------
  def create
    @post = Post.find(params[:post_id])
    lol = Lol.new(post_id: @post.id)
    lol.save
  end
end
