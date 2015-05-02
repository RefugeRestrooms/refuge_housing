class PostsController < ApplicationController
  def index
    @posts = post_search
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(create_constructor(post_params))

    return unless @post.save!

    ConfirmationMailer.confirmation_email(@post).deliver_now
    redirect_to success_url
  end

  def confirm
    redirect_to(error_validation_url) && return unless check_validation

    post = Post.find_by_validation(params[:validation])

    toggle_show(post, true)

    redirect_to confirm_success_url(id: post.id)
  end

  def confirm_success
    @post = Post.find(params[:id])
    ConfirmationMailer.posted_email(@post).deliver_now
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    redirect_to(error_validation_url) && return unless check_validation

    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render action: "edit"
    end
  end

  def destroy
    redirect_to(error_validation_url) && return unless check_validation

    post = Post.find_by_validation(params[:validation])

    toggle_show(post, false)

    redirect_to destroy_success_url(id: post.id)
  end

  private

  def check_validation
    params.key?(:validation) && params[:validation].match(/.{32}/)
  end

  def toggle_show(post, show)
    redirect_to(error_validation_url) && return if post.nil?

    post.update_attributes(
      show: show,
      expiration: Time.current.utc + 2.weeks
    )
  end

  def post_params
    params.require(:post)
      .permit(
        :title,
        :post_type,
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
    # a collision here has low probability, but might as well check
    loop do
      init_params[:validation] = SecureRandom.hex
      break if Post.find_by_validation(init_params[:validation]).nil?
    end
    init_params[:post_type] = params[:post_type].to_i
    init_params
  end

  def query_location
    if params[:search].present?
      Post.active.near(params[:search])
    else
      Post.active
    end
  end

  def post_search
    posts = query_location

    if params[:available_or_needed] == "available"
      posts.available
    elsif params[:available_or_needed] == "needed"
      posts.needed
    else
      posts
    end
  end
end
