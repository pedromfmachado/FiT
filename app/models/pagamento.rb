class Pagamento < ActiveRecord::Base
  belongs_to :user

  def update_mensal

    #if Pagamento.all.max(:month) >= Time.now.
    User.all.each do |u|

      if u.normal?

        Pagamento.new do |p|

          p.user_id = u.id
          p.pago = false
          p.mes = Time.now.month

        end

      end

    end

  end
end
