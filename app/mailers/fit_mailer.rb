require 'digest/sha2'
class FitMailer < ActionMailer::Base

  default :from => "FiT Staff <geral.fit@gmail.com>",
          :charset => "UTF-8"

  def welcome_email(user, password, sent_at = Time.now)
    @user = user
    @password = password
    @url = root_url

    headers[:date] = sent_at
    headers["message-id"] = "#{Digest::SHA2.hexdigest(sent_at.to_i.to_s)}@fitec.com"
    mail(:to => user.email, :subject => "Bem vindo ao melhor ginasio de sempre!")
  end

end

