require 'test_helper'

class NotificacaoTest < ActiveSupport::TestCase
	def setup
		@notificacao1 = Notificacao.new(:data => Time.now, :titulo => "Novas maquinas em Janeiro", :texto => "O Ginasio vai ter novas maquinas em 2012", :admin_id => Admin.find_by_user_id(users(:pedro).id))
		@notificacao2 = Notificacao.new(:data => Time.now, :texto => "teste de titulo vazio", :admin_id => Admin.find_by_user_id(users(:pedro).id))
		@notificacao3 = Notificacao.new(:data => Time.now, :titulo => "teste de texto vazio", :admin_id => Admin.find_by_user_id(users(:pedro).id))
	end

	def teardown
		@notificacao1.destroy unless @notificacao1.nil?
		@notificacao2.destroy unless @notificacao2.nil?
		@notificacao3.destroy unless @notificacao3.nil?
	end

	test "notificacao create" do
		assert_equal "Novas maquinas em Janeiro", @notificacao1.titulo
		assert_equal "O Ginasio vai ter novas maquinas em 2012", @notificacao1.texto
		assert @notificacao2.titulo.blank?
		assert_equal "teste de titulo vazio", @notificacao2.texto
		assert_equal "teste de texto vazio", @notificacao3.titulo
		assert @notificacao3.texto.blank?
	end

	test "notificacao save" do
		assert @notificacao1.save
		assert !@notificacao2.save
		assert !@notificacao3.save
	end
end
