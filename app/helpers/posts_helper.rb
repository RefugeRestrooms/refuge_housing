module PostsHelper
  def delete_post_link(post)
    link_to_url(delete_post_url(post, post.validation))
  end

  def edit_post_link(post)
    link_to_url(edit_post_url(post, validation: post.validation))
  end

  def confirm_post_link(post)
    link_to_url(confirm_post_url(post, post.validation))
  end

  def post_link(post)
    link_to_url(post_url(post))
  end

  def link_to_url(url)
    link_to(url, url)
  end
end
