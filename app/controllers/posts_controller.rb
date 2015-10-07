class PostsController < ApplicationController
  def index
    if check_for_search_params
      @posts = post_search
    else
      @posts = Post.active
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(Post.create_default_params(post_params))

    if @post.save
      ConfirmationMailer.confirmation_email(@post).deliver_now
      redirect_to posts_success_url
    else
      render action: "new"
    end
  end

  def edit
    redirect_to(validation_error_url) && return unless check_validation

    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    redirect_to(validation_error_url) && return unless check_validation

    @post = Post.find_by_validation(params[:validation])

    if @post.update_attributes(post_params.merge(post_type: post_params[:post_type].to_i))
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

    @post = Post.find_by_validation(params[:validation])
    redirect_to(validation_error_url) && return if @post.nil?

    @post.toggle_show(true)
    ConfirmationMailer.posted_email(@post).deliver_now
  end

  # Get wrapper/confirmation for destroy
  def delete
    redirect_to(validation_error_url) && return unless check_validation && params.key?(:id)
  end

  def validation_error
  end

  private

  def check_validation
    params.key?(:validation) && params[:validation].match(/^.{32}$/)
  end

  def post_params
    params.require(:post)
      .permit(
        :title,
        :post_type,
        :email,
        :email_confirmation,
        :street,
        :city,
        :state,
        :postal_code,
        :country,
        :neighborhood,
        :description,
        :accuracy
      )
  end

  def check_for_search_params
    [:type, :location, :query].any? { |k| params.key?(k) }
  end

  def query_location(posts)
    if params[:location].blank?
      posts
    else
      posts.near(params[:location])
    end
  end

  def query_description(posts)
    if params[:query].blank?
      posts
    else
      posts.search(params[:query])
    end
  end

  def filter_type(posts)
    if params[:type] == "available"
      posts.available
    elsif params[:type] == "needed"
      posts.needed
    else
      posts
    end
  end

  def post_search
    posts = Post.active
    posts = query_location(posts)
    posts = query_description(posts)
    filter_type(posts)
  end
end
