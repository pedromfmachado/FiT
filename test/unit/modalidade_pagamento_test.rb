require 'test_helper'

class ModalidadePagamentoTest < ActiveSupport::TestCase

  def setup
    @modalpagam1 = ModalidadePagamento.new(:nome => "Modalidade X", :preco => 20.0)
    @modalpagam3 = ModalidadePagamento.new(:nome => "ABC paga voce")
    @modalpagam4 = ModalidadePagamento.new(:preco => 0.0)
  end

  def teardown
    @modalpagam1.destroy unless @modalpagam1.nil?
    @modalpagam3.destroy unless @modalpagam3.nil?
    @modalpagam4.destroy unless @modalpagam4.nil?
  end

  test "modalidade pagamento create" do
    assert_equal "Modalidade X", @modalpagam1.nome
    assert_equal 20.0, @modalpagam1.preco

    assert_equal "ABC paga voce", @modalpagam3.nome
    assert @modalpagam3.preco.blank?

    assert @modalpagam4.nome.blank?
    assert_equal 0.0, @modalpagam4.preco
  end

  test "modalidade pagamento save" do
    assert @modalpagam1.save
    assert !@modalpagam3.save
    assert !@modalpagam4.save
  end
end

