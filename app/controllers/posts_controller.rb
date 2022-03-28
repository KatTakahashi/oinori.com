class PostsController < ApplicationController
  # ---------- 投稿機能 ----------
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to root_path
  end

  # ---------- 投稿削除機能 ----------
  def destroy
  end

  private
  # --------------- ストロングパラメータ --------------
  def post_params
    params.require(:post).permit(:body)
  end
end
