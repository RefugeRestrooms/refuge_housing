class SearchController < ApplicationController
  def index
    if params[:search].present?
      @posts = Post.near(params[:search])
    else
      @posts = Post.all
    end
  end
end
