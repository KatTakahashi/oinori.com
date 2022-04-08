class PostsController < ApplicationController
  # ---------- トップページ ----------
  def top
    @post = Post.new
    posts_sort
  end

  # ---------- 投稿機能 ----------
  def create
    @post = Post.new(post_params)
    @post.ip = poster_ip
    @post.score = Language.get_data(post_params[:body])
    if @post.save
      redirect_to request.referer
    else
      @post = Post.new(post_params)
      posts_sort
      render 'top'
    end
  end

  # ---------- 投稿編集機能 ----------
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.score = Language.get_data(post_params[:body])
    @post.update(post_params)
    redirect_to root_path
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

  # 全投稿取得(N+1対策済み)
  def posts_all
    Post.preload(:lols)
  end

  # ソート用投稿一覧
  def posts_sort
    if params[:latest]
      @posts = posts_all.order(created_at: :desc)
    elsif params[:old]
      @posts = posts_all.order(created_at: :asc)
    elsif params[:lol_count]
      @posts = posts_all.find(Lol.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    else
      @posts = posts_all.order(created_at: :desc)
    end
  end
end
