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
    redirect_to posts_success_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    redirect_to(validation_error_url) && return unless check_validation

    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render action: "edit"
    end
  end

  def destroy
    redirect_to(validation_error_url) && return unless check_validation

    post = Post.find_by_validation(params[:validation])
    redirect_to(validation_error_url) && return if post.nil?

    post.toggle_show(false)

    ConfirmationMailer.deleted_email(post).deliver_now

    flash[:notice] = "Post successfully deleted"
  end

  def confirm
    redirect_to(validation_error_url) && return unless check_validation

    post = Post.find_by_validation(params[:validation])
    redirect_to(validation_error_url) && return if post.nil?

    post.toggle_show(true)

    ConfirmationMailer.posted_email(post).deliver_now
  end

  # Get wrapper/confirmation for destroy
  def delete
    redirect_to(validation_error_url) && return unless check_validation
  end

  def validation_error
  end

  private

  def check_validation
    params.key?(:id) && params.key?(:validation) && params[:validation].match(/^.{32}$/)
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
    init_params[:post_type] = params[:post_type].to_i
    init_params[:validation] = generate_validation
    init_params
  end

  def generate_validation
    # a collision here has low probability, but might as well check
    loop do
      validation = SecureRandom.hex
      return validation if Post.find_by_validation(init_params[:validation]).nil?
    end
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
