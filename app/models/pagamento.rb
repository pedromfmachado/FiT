class Pagamento < ActiveRecord::Base
  belongs_to :user

  def self.update_mensal

    if (Pagamento.maximum(:ano).to_i <= Time.now.year &&  Pagamento.maximum(:mes).to_i < Time.now.month) ||
      Pagamento.maximum(:ano) == nil
      User.all.each do |u|

        if u.normal?

          pagamento = Pagamento.new do |p|

            p.user_id = u.id
            p.pago = false
            p.mes = Time.now.month
            p.ano = Time.now.year

          end

          pagamento.save

        end

      end

    else

      User.all.each do |u|

        if Pagamento.where(:user_id => u.id, :mes => Time.now.month, :ano => Time.now.year).count == 0 && u.normal?

          pagamento = Pagamento.new do |p|

            p.user_id = u.id
            p.pago = false
            p.mes = Time.now.month
            p.ano = Time.now.year

          end

          pagamento.save

        end

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
      xml.preco self.user.modalidade_pagamento.preco
      xml.pago self.pago
    end
  end 
    
end
