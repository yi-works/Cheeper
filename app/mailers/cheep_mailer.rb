class CheepMailer < ApplicationMailer
  def cheep_mail(cheep)
    @cheep = cheep

    mail to: cheep.user.email, subject: '送信完了メール'
  end
end
