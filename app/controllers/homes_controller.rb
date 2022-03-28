class HomesController < ApplicationController
  # ---------- トップページ ----------
  def top
    @post = Post.new
    @posts = Post.all
  end
end
