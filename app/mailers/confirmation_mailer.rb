class ConfirmationMailer < ApplicationMailer
  add_template_helper(PostsHelper)
  add_template_helper(ApplicationHelper)

  default from: "no-reply@refuge.lgbt"

  def confirmation_email(post)
    @post = post
    mail(to: post.email, subject: "Refuge Housing: Confirm Your Post")
  end

  def posted_email(post)
    @post = post
    mail(to: post.email, subject: "Refuge Housing: Your Post is Confirmed")
  end

  def deleted_email(post)
    @post = post
    mail(to: post.email, subject: "Refuge Housing: Your Post Has Been Deleted")
  end
end
