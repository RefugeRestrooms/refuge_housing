module PostsHelper
  def delete_post_link(post)
    link_to_url(posts_delete_url(post, validation: post.validation, id: post.id))
  end

  def edit_post_link(post)
    link_to_url(edit_post_url(post, validation: post.validation))
  end

  def confirm_post_link(post)
    link_to_url(posts_confirm_url(post, validation: post.validation, id: post.id))
  end

  def post_link(post)
    link_to_url(post_url(post))
  end

  def link_to_url(url)
    link_to(url, url)
  end
end
