class ConfirmationMailer < ApplicationMailer
  default from: "no-reply@refuge.lgbt"

  def confirmation_email(email, validation)
    @email = email
    @validation = validation
    @url = "#{confirmation_url}/?validation=#{validation}"
    mail(to: email, subject: "Confirm Your Post on Refuge Housing")
  end

  def posted_email(@post)
    @email = @post.email
    @validation = @post.validation
    @delete_url = "#{delete_url}/?validation=#{@validation}"
    @edit_url = "#{edit_url}/?validation=#{@validation}"
    @post_url = post_url(@post)
  end
end
