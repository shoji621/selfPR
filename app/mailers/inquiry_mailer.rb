class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'selfpr@example.com',
      to:   't65.shoji.takahiro@gmail.com',
      subject: 'お問い合わせ通知'
    )
  end
end
