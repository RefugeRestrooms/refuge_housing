class ConfirmationMailer < ApplicationMailer
  default from: "no-reply@refuge.lgbt"

  def confirmation_email(post)
    @url = "#{posts_confirm_url(post)}/?validation=#{post.validation}&id=#{post.id}"
    mail(to: post.email, subject: "Refuge Housing: Confirm Your Post")
  end

  def posted_email(post)
    @email = post.email
    @validation = post.validation
    @delete_url = "#{post_url(:destroy, post)}/?validation=#{@validation}"
    @edit_url = "#{edit_post_url(post)}/?validation=#{@validation}"
    @post_url = post_url(post)
    mail(to: @email, subject: "Refuge Housing: Your Post is Confirmed")
  end

  def deleted_email(post)
    @url = "#{posts_confirm_url(post)}/?validation=#{post.validation}&id=#{post.id}"
    mail(to: post.email, subject: "Refuge Housing: Your Post Has Been Deleted")
  end
end
