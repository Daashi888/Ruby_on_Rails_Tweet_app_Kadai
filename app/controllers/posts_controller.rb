class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
    redirect_to new_post_path, notice: "つぶやきを投稿しました！"
    else
      render :new
    end
  end

  def show #詳細画面

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "投稿内容を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました！"
  end

  def confirm
    @post = Post.new(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
