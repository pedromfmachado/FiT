class Pagamento < ActiveRecord::Base
  belongs_to :user

  def update_mensal

    if Pagamento.maximum(:ano) <= Time.now.year &&  Pagamento.maximum(:mes) < Time.now.month
      User.all.each do |u|

        if u.normal?

          Pagamento.new do |p|

            p.user_id = u.id
            p.pago = false
            p.mes = Time.now.month
            p.ano = Time.now.year

          end

        end

      end

    end

  end
  
end
