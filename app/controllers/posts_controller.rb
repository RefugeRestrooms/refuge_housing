class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(create_constructor(post_params))

    @post.save!
    redirect_to success_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render action: "edit"
    end
  end

  private

  def post_params
    params.require(:post)
      .permit(
        :title,
        :email,
        :street,
        :city,
        :state,
        :country,
        :neighborhood,
        :description
      )
  end

  def create_constructor(init_params)
    require "securerandom"
    init_params[:expiration] = (Time.current.utc + 1.day).iso8601
    init_params[:validation] = SecureRandom.hex
    init_params
  end
end
