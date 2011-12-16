class Plano < ActiveRecord::Base

	has_many :exercicios_planoss
	has_many :exercicios, :through => :exercicios_planoss
	belongs_to :user

	validates :data, :presence => true
	validates :peso, :presence => true
	validates :altura, :presence => true

	def apagarPedido(uid)

		pedido = PedidoPlano.find_by_user_id(uid).destroy
		if pedido != nil

			pedido.destroy

		end

	end

	require 'builder'
	def xml_plano()
		xml = ::Builder::XmlMarkup.new(:indent=>2)
		xml.instruct!

		xml.plano do
			xml.data data
			xml.altura altura
			xml.peso peso
			xml.exercicios do
				exercicios.each do |ex|
					dados = ExerciciosPlanos.where(:plano_id => id, :exercicio_id => ex.id).first
					xml.exercicio do
						xml.nome ex.nome
						xml.maquina ex.maquina
						xml.tipo ex.tipo
						xml.peso dados.peso
						xml.series dados.series
						xml.repeticoes dados.repeticoes
					end
				end
			end
		end
	end


end
