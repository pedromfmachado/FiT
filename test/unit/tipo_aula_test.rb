require 'test_helper'

class TipoAulaTest < ActiveSupport::TestCase
  	def setup
		@tipoaula1 = TipoAula.new(:tipo=>"Cycle", :descricao=>"Aula de grupo, indoor, em que os participantes estao a ouvir musica e sao coordenados por um membro do staff.")
		@tipoaula2 = TipoAula.new(:tipo=>"Localizada")
		@tipoaula3 = TipoAula.new(:descricao=>"Aulas que se focam em exercicitar partes especificas do corpo")
	end

	def teardown
		@tipoaula1.destroy unless @tipoaula1.nil?
		@tipoaula2.destroy unless @tipoaula2.nil?
		@tipoaula3.destroy unless @tipoaula3.nil?
	end

	test "TipoAula create" do
		assert_equal "Cycle", @tipoaula1.tipo
		assert_equal "Aula de grupo, indoor, em que os participantes estao a ouvir musica e sao coordenados por um membro do staff.", @tipoaula1.descricao
		assert @tipoaula2.descricao.blank?
		assert_equal "Localizada", @tipoaula2.tipo
		assert_equal "Aulas que se focam em exercicitar partes especificas do corpo", @tipoaula3.descricao
		assert @tipoaula3.tipo.blank?
	end

	test "TipoAula save" do
		assert @tipoaula1.save
		assert !@tipoaula2.save
		assert !@tipoaula3.save
	end
end
