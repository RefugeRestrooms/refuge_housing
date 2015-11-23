class PostsController < ApplicationController
  before_action :assign_post_by_validation_and_id, only: [:edit,
                                                          :update,
                                                          :destroy,
                                                          :confirm]

  def index
    @posts = Post.active.
                filter_near(search_params[:location]).
                filter_query(search_params[:query]).
                filter_type(search_params[:type])
  end

  def new
    @post = Post.new(post_type: "needed")
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
  end

  def show
    @post = Post.active.find(params[:id])
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render action: "edit"
    end
  end

  def destroy
    @post.toggle_show(false)

    ConfirmationMailer.deleted_email(@post).deliver_now

    flash[:notice] = "Post successfully deleted"
  end

  def confirm
    @post.toggle_show(true)
    ConfirmationMailer.posted_email(@post).deliver_now
  end

  def validation_error
  end

  private

  def assign_post_by_validation_and_id
    @post = Post.where(id: find_post_params[:id],
                       validation: find_post_params[:validation]).first

    redirect_to(validation_error_url) && return if @post.nil?
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

  def find_post_params
    params.permit(:id, :validation)
  end

  def search_params
    params.permit(:location, :query, :type)
  end
end
