class SearchController < ApplicationController
  def index
    @post = post_search
  end
end

private

def post_search
  @posts = query_location
  @posts = add_show_filter(@posts)
  @posts = add_expiration_filter(@posts)
  @posts = add_type_filter(@posts)
end

def query_location
  if params[:search].present?
    Post.near(params[:search])
  else
    Post.all
  end
end

def add_show_filter(posts)
  posts.where("show = true")
end

def add_expiration_filter(posts)
  posts.where("expiration >= '#{Time.current.utc}'")
end

def add_type_filter(posts)
  filters = params.select { |k, _v| Post::POST_TYPES.include?(k) }
  if filters.any?
    filter = filters.keys.map { |k| "post_type = '#{k}'" }.join(" OR ")
    posts.where(filter)
  else
    posts
  end
end
