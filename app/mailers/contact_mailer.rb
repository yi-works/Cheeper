class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: "メールアドレス", subject: "お問い合わせメール"
  end
end
