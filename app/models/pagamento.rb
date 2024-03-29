class Pagamento < ActiveRecord::Base
  belongs_to :user
  belongs_to :modalidade_pagamento

  validates_presence_of :user_id, :message => "tem de ter um utilizador associado."
  validates_presence_of :mes, :message => "tem de ter um mes correspondente."
  validates_presence_of :ano, :message => "tem de ter um ano correspondente."
  validates_presence_of :preco, :message => "tem de ter um preco associado"
  validates_presence_of :modalidade_pagamento_id, :message => "tem de ter uma modalidade associada."

  def self.update_mensal

      User.all.each do |u|

        if Pagamento.where(:user_id => u.id, :mes => Time.now.month, :ano => Time.now.year).count == 0 &&
             u.normal? && u.modalidade_pagamento_id

          pagamento = Pagamento.new do |p|

            p.user_id = u.id
            p.pago = false
            p.mes = Time.now.month
            p.ano = Time.now.year
            p.preco = p.user.modalidade_pagamento.preco
            p.modalidade_pagamento_id = p.user.modalidade_pagamento_id

          end

          pagamento.save

        end
      end
  end

  require 'builder'
  def to_xml(options ={})
    if options[:builder]
      build_xml(options[:builder])
    else
      xml = Builder::XmlMarkup.new
      xml.instruct!
      build_xml(xml)
    end
  end

  def build_xml(xml)
    xml.aula do
      xml.preco self.preco
      xml.modalidade self.modalidade_pagamento.nome
      xml.pago self.pago
      xml.mes self.mes
      xml.ano self.ano
    end
  end 
    
end
