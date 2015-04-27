class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(create_constructor(post_params))

    if @post.save!
      ConfirmationMailer.confirmation_email(@post.email, @post.validation).deliver_now

     redirect_to success_url
    end
  end

  def confirm
    unless check_validation
      redirect_to(error_validation_url) and return
    end

    post = Post.find_by_validation(params[:validation])

    if post.nil?
      redirect_to(error_validation_url) and return
    end

    post.update_attributes(
      :show => true,
      :expiration => Time.current.utc + 2.weeks
    )

    redirect_to confirm_success_url(:id => post.id)
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

  def confirm_success
    @post = Post.find(params[:id])
    ConfirmationMailer.posted_email(@post).deliver_now
  end

  def delete
  end

  private

  def check_validation
    params.has_key?(:validation) && params[:validation].match(/.{32}/)
  end

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
