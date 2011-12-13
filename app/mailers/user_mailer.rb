class UserMailer < ActionMailer::Base
  
	default :from => 'fit.geral@gmail.com'

  def pedirplano(user)
    mail(:to => "fit.geral@gmail.com", :subject => "pedido de novo plano de treino")
  end
end

