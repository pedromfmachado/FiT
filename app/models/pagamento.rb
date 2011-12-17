class Pagamento < ActiveRecord::Base
  belongs_to :user

  def update_mensal

    pagamento = Pagamento.new do |p|

      p.user_id = 5
      p.pago = true
      p.mes = 11

    end

    pagamento.save

    self.delay.update_mensal

  end

  def self.start

    new.update_mensal

  end
end
