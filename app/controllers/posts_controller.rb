class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.new(post_params)

    @post.save
    redirect_to success_url
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(
                           :title,
                           :email,
                           :street,
                           :neighborhood,
                           :description
                          )
  end
end
