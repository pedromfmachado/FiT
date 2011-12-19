require 'test_helper'

class PagamentoTest < ActiveSupport::TestCase
  def setup
    @pagamento1 = Pagamento.new(:user_id=>users(:andre_alves).id, :mes=>12, :pago=>true, :ano=>2011, :preco=>33.5, :modalidade_pagamento_id=>modalidade_pagamentos(:modalidade1))
    @pagamento2 = Pagamento.new(:mes=>12, :pago=>true, :ano=>2011, :preco=>33.5, :modalidade_pagamento_id=>modalidade_pagamentos(:modalidade1))
    @pagamento3 = Pagamento.new(:user_id=>users(:andre_alves).id, :pago=>true, :ano=>2011, :preco=>33.5, :modalidade_pagamento_id=>modalidade_pagamentos(:modalidade1))
    @pagamento4 = Pagamento.new(:user_id=>users(:andre_alves).id, :mes=>12, :pago=>true, :preco=>33.5, :modalidade_pagamento_id=>modalidade_pagamentos(:modalidade1))
    @pagamento5 = Pagamento.new(:user_id=>users(:andre_alves).id, :mes=>12, :pago=>true, :ano=>2011, :modalidade_pagamento_id=>modalidade_pagamentos(:modalidade1))
    @pagamento6 = Pagamento.new(:user_id=>users(:andre_alves).id, :mes=>12, :pago=>true, :ano=>2011, :preco=>33.5)
  end

  def teardown
    @pagamento1.destroy unless @pagamento1.nil?
    @pagamento2.destroy unless @apgamento2.nil?
    @pagamento3.destroy unless @pagamento3.nil?
  end

  test "pagamento create" do
    assert_equal 12, @pagamento1.mes
    assert_equal true, @pagamento1.pago
    assert_equal 2011, @pagamento1.ano
    assert_equal 33.5, @pagamento1.preco

    assert @pagamento2.user_id.blank?
    assert_equal 12, @pagamento2.mes
    assert_equal true, @pagamento2.pago
    assert_equal 2011, @pagamento2.ano
    assert_equal 33.5, @pagamento2.preco

    assert @pagamento3.mes.blank?
    assert_equal true, @pagamento3.pago
    assert_equal 2011, @pagamento3.ano
    assert_equal 33.5, @pagamento3.preco

    assert_equal 12, @pagamento4.mes
    assert_equal true, @pagamento4.pago
    assert @pagamento4.ano.blank?
    assert_equal 33.5, @pagamento4.preco
    
    assert_equal 12, @pagamento5.mes
    assert_equal true, @pagamento5.pago
    assert_equal 2011, @pagamento5.ano
    assert @pagamento5.preco.blank?

    assert_equal 12, @pagamento6.mes
    assert_equal true, @pagamento6.pago
    assert_equal 2011, @pagamento6.ano
    assert_equal 33.5, @pagamento6.preco
    assert @pagamento6.modalidade_pagamento_id.blank?

  end

  test "pagamento save" do
    assert @pagamento1.save
    assert !@pagamento2.save
    assert !@pagamento3.save
    assert !@pagamento4.save
    assert !@pagamento5.save
    assert !@pagamento6.save
  end
end
