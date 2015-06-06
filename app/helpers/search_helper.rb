module SearchHelper
  def maps_query(post)
    "#{post.city}, #{post.state} #{post.country}"
  end
end
