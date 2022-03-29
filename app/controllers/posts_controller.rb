class PostsController < ApplicationController
  # ---------- トップページ ----------
  def top
    @post = Post.new
    @posts = Post.all
  end

  # ---------- 投稿機能 ----------
  def create
    @post = Post.new(post_params)
    @post.ip = poster_ip
    if @post.save
      redirect_to request.referer
    else
      @post = Post.new(post_params)
      @posts = Post.all
      render 'top'
    end
  end

  # ---------- 投稿削除機能 ----------
  def destroy
    post = Post.find(params[:id])
    if post.ip = poster_ip
      post.destroy
    end
    redirect_to request.referer
  end

  private
  # --------------- ストロングパラメータ --------------
  def post_params
    params.require(:post).permit(:body)
  end

  # 投稿者のIPアドレス取得
  def poster_ip
    request.ip
  end
end
