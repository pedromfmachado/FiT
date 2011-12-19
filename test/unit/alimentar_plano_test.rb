require 'test_helper'

class AlimentarPlanoTest < ActiveSupport::TestCase
  	def setup
		@plano1 = AlimentarPlano.new(:data=>Time.now, :pequenoalmoco=>"Copo de leite", :manha=>"Fruta", :almoco=>"Sardinhas", :tarde=>"Fruta", :jantar=>"Bacalhau", :ceia=>"3 bolachas", :user_id=>users(:andre_alves).id)
		@plano2 = AlimentarPlano.new(:data=>Time.now, :manha=>"Fruta", :almoco=>"Sardinhas", :tarde=>"Fruta", :jantar=>"Bacalhau", :ceia=>"3 bolachas", :user_id=>users(:andre_alves).id)
		@plano3 = AlimentarPlano.new(:data=>Time.now, :pequenoalmoco=>"Copo de leite", :almoco=>"Sardinhas", :tarde=>"Fruta", :jantar=>"Bacalhau", :ceia=>"3 bolachas", :user_id=>users(:andre_alves).id)
		@plano4 = AlimentarPlano.new(:data=>Time.now, :pequenoalmoco=>"Copo de leite", :manha=>"Fruta", :tarde=>"Fruta", :jantar=>"Bacalhau", :ceia=>"3 bolachas", :user_id=>users(:andre_alves).id)
		@plano5 = AlimentarPlano.new(:data=>Time.now, :pequenoalmoco=>"Copo de leite", :manha=>"Fruta", :almoco=>"Sardinhas", :jantar=>"Bacalhau", :ceia=>"3 bolachas", :user_id=>users(:andre_alves).id)
		@plano6 = AlimentarPlano.new(:data=>Time.now, :pequenoalmoco=>"Copo de leite", :manha=>"Fruta", :almoco=>"Sardinhas", :tarde=>"Fruta", :ceia=>"3 bolachas", :user_id=>users(:andre_alves).id)
		@plano7 = AlimentarPlano.new(:data=>Time.now, :pequenoalmoco=>"Copo de leite", :manha=>"Fruta", :almoco=>"Sardinhas", :tarde=>"Fruta", :jantar=>"Bacalhau", :user_id=>users(:andre_alves).id)
		@plano8 = AlimentarPlano.new(:data=>Time.now, :pequenoalmoco=>"Copo de leite", :manha=>"Fruta", :almoco=>"Sardinhas", :tarde=>"Fruta", :jantar=>"Bacalhau", :ceia=>"3 bolachas")
	end

	def teardown
		@plano1.destroy unless @plano1.nil?
		@plano2.destroy unless @plano1.nil?
		@plano3.destroy unless @plano1.nil?
		@plano4.destroy unless @plano1.nil?
		@plano5.destroy unless @plano1.nil?
		@plano6.destroy unless @plano1.nil?
		@plano7.destroy unless @plano1.nil?
		@plano8.destroy unless @plano1.nil?
	end

	test "AlimentarPlano create" do
		assert_equal "Cycle", @tipoaula1.tipo
		assert_equal "Aula de grupo, indoor, em que os participantes estao a ouvir musica e sao coordenados por um membro do staff.", @tipoaula1.descricao
		assert @tipoaula2.descricao.blank?
		assert_equal "Localizada", @tipoaula2.tipo
		assert_equal "Aulas que se focam em exercicitar partes especificas do corpo", @tipoaula3.descricao
		assert @tipoaula3.tipo.blank?
	end

	test "AlimentarPlano save" do
		assert @plano1.save
		assert !@plano2.save
		assert !@plano3.save
		assert !@plano2.save
		assert !@plano2.save
	end
end
