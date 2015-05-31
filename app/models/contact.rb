class Contact < MailForm::Base
  include ActiveModel::Validations
  attribute :name,      validate: true
  attributes :email,    validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   validate: true
  attributes :nickname, captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: "Contact Us",
      to: "contact@refuge.lgbt",
      from: %("#{name}" <#{email}>)
    }
  end
end
