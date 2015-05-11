class NoticeMailer < ActionMailer::Base
  default from: "asaoushine4@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm
    @greeting = "Hi"

    mail to: "asaoushine6@gmail.com", subject: "ActionMailer test"

  end
end
