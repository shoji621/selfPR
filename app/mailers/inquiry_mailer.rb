class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    @url = 'https://selfpr.herokuapp.com/users/sign_in'
    mail(
      to:        @inquiry.user.email,
      bcc:       ENV['SELFPR_GMAIL_ADDRESS'],
      subject:   '【selfpr】お問い合わせ通知',
      reply_to:  ENV['SELFPR_GMAIL_ADDRESS']
    )
  end
end
