# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview
  def inquiry
    inquiry = Inquiry.find(1)
    InquiryMailer.send_mail(inquiry)
  end
end