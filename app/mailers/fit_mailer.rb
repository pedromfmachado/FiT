class FitMailer < ActionMailer::Base
  default :from => "FiT Staff <geral.fit@gmail.com>",
          :date => Time.now

  def welcome_email(user)
    @user = user
    @url = root_url
    mail(:to => user.email, :subject => "Bem vindo ao melhor ginasio de sempre!")
  end

  def pedir_plano(user)
    @user = user
    @url = root_url
    mail(:to => user.email, :subject => "Pedido de novo Plano")
  end

end
