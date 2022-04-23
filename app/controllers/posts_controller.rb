class PostsController < ApplicationController
  # ---------- トップページ ----------
  def top
    countdown
    @post = Post.new
    latest_post
    posts_all_with_sort
    visiters
  end

  # ---------- 投稿機能 ----------
  def create
    @post = Post.new(post_params)
    @post.ip = poster_ip
    @post.score = Language.get_data(post_params[:body])
    if @post.save
      Lol.create(post_id: @post.id)
      redirect_to request.referer
    else
      @post = Post.new(post_params)
      posts_all_with_sort
      render 'top'
    end
  end

  # ---------- 投稿編集機能 ----------
  # def edit
  #   @post = Post.find(params[:id])
  # end

  # def update
  #   @post = Post.find(params[:id])
  #   @post.score = Language.get_data(post_params[:body])
  #   @post.update(post_params)
  #   redirect_to root_path
  # end

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

  # ソート用投稿一覧
  def posts_all_with_sort
    if params[:latest]
      @posts = posts_all.order(created_at: :desc)
    elsif params[:old]
      @posts = posts_all.order(created_at: :asc)
    elsif params[:lol]
      @posts = posts_all.find(Lol.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    elsif params[:critical]
      @posts = posts_all.order(score: :asc)
    else
      @posts = posts_all.order(created_at: :desc)
    end
  end
end
