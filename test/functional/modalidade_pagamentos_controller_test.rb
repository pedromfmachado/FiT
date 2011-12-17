require 'test_helper'

class ModalidadePagamentosControllerTest < ActionController::TestCase
  setup do
    @modalidade_pagamento = modalidade_pagamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modalidade_pagamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modalidade_pagamento" do
    assert_difference('ModalidadePagamento.count') do
      post :create, :modalidade_pagamento => @modalidade_pagamento.attributes
    end

    assert_redirected_to modalidade_pagamento_path(assigns(:modalidade_pagamento))
  end

  test "should show modalidade_pagamento" do
    get :show, :id => @modalidade_pagamento.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @modalidade_pagamento.to_param
    assert_response :success
  end

  test "should update modalidade_pagamento" do
    put :update, :id => @modalidade_pagamento.to_param, :modalidade_pagamento => @modalidade_pagamento.attributes
    assert_redirected_to modalidade_pagamento_path(assigns(:modalidade_pagamento))
  end

  test "should destroy modalidade_pagamento" do
    assert_difference('ModalidadePagamento.count', -1) do
      delete :destroy, :id => @modalidade_pagamento.to_param
    end

    assert_redirected_to modalidade_pagamentos_path
  end
end
