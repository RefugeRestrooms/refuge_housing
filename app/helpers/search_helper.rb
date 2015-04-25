module SearchHelper
  def maps_query(post)
    "#{post.street} #{post.city}, #{post.state} #{post.country}"
  end
end
