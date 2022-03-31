class PostsController < ApplicationController
  # ---------- トップページ ----------
  def top
    @post = Post.new
    @latest_posts = Post.all.order(created_at: :desc)
    @popular_posts = Post.find(Lol.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
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
    if logged_in? || post.ip == poster_ip
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
