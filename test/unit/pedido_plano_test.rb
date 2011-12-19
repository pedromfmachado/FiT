require 'test_helper'

class PedidoPlanoTest < ActiveSupport::TestCase

  def setup
    @date_now = Time.now
    @pedido1 = PedidoPlano.new(:data_pedido => @date_now, :user_id => users(:andre_marinho).id)
    @pedido2 = PedidoPlano.new(:data_pedido => @date_now)
    @pedido3 = PedidoPlano.new(:user_id => users(:andre_alves).id)
  end

  def teardown
    PedidoPlano.destroy_all(["data_pedido = ? AND user_id = ?", @date_now, users(:andre_marinho).id])
  end

  test "pedido plano create" do
    assert_equal @date_now, @pedido1.data_pedido
    assert_equal users(:andre_marinho).id, @pedido1.user_id

    assert_equal @date_now, @pedido2.data_pedido
    assert @pedido2.user_id.blank?

    assert @pedido3.data_pedido.blank?
    assert @pedido3.user_id, users(:andre_alves).id
  end

  test "pedido plano create" do
    assert @pedido1.save

    # missing parameters
    assert !@pedido2.save
    assert !@pedido3.save

    # unique restriction
    pedido = PedidoPlano.new(:data_pedido => Time.now, :user_id => users(:andre_marinho).id)
    assert !pedido.save
  end

end
