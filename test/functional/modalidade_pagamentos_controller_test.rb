require 'test_helper'

class ModalidadePagamentosControllerTest < ActionController::TestCase
  setup do
    @modalidade_pagamento = modalidade_pagamentos(:modalidade1)

    @user = users(:andre_alves)
    @staff = users(:goncalo)
    @admin = users(:pedro)
  end

  test "should not get index" do
    get :index
    assert_user_prohibition
  end

  test "should get index 1" do
    @request.session[:user_id] = @user.id
    get :index
    assert_response :success
    assert_not_nil assigns(:modalidade_pagamentos)
  end

  test "should get index 2" do
    @request.session[:user_id] = @staff.id
    get :index
    assert_response :success
    assert_not_nil assigns(:modalidade_pagamentos)
  end

  test "should get index 3" do
    @request.session[:user_id] = @admin.id
    get :index
    assert_response :success
    assert_not_nil assigns(:modalidade_pagamentos)
  end

  test "should not get new 1" do
    get :new
    assert_user_prohibition
  end

  test "should not get new 2" do
    @request.session[:user_id] = @user.id
    get :new
    assert_user_prohibition
  end

  test "should not get new 3" do
    @request.session[:user_id] = @staff.id
    get :new
    assert_user_prohibition
  end

  test "should get new 1" do
    @request.session[:user_id] = @admin.id
    get :new
    assert_response :success
    assert_not_nil assigns(:modalidade_pagamento)
  end

  test "should not create modalidade pagamento 1" do
    # no login
    assert_no_difference('ModalidadePagamento.count') do
      post :create, :modalidade_pagamento => {
        :nome => "aBorlioux",
        :preco => 10.0
      }
    end
    assert_user_prohibition
  end

  test "should not create modalidade pagamento 2" do
    # ordinary user
    @request.session[:user_id] = @user.id
    assert_no_difference('ModalidadePagamento.count') do
      post :create, :modalidade_pagamento => {
        :nome => "aBorlioux",
        :preco => 10.0
      }
    end
    assert_user_prohibition
  end

  test "should not create modalidade pagamento 3" do
    # staff
    @request.session[:user_id] = @staff.id
    assert_no_difference('ModalidadePagamento.count') do
      post :create, :modalidade_pagamento => {
        :nome => "aBorlioux",
        :preco => 10.0
      }
    end
    assert_user_prohibition
  end

  test "should create modalidade pagamento 1" do
    # admin
    @request.session[:user_id] = @admin.id
    assert_difference('ModalidadePagamento.count') do
      post :create, :modalidade_pagamento => {
        :nome => "aBorlioux",
        :preco => 10.0
      }
    end

    assert_redirected_to modalidade_pagamento_path(assigns(:modalidade_pagamento))
    assert_equal 'Modalidade Pagamento criada com sucesso.', flash[:success]
  end

  test "should not show modalidade pagamento 1" do
    get :show, :id => @modalidade_pagamento.id
    assert_user_prohibition
  end

  test "should show modalidade pagamento" do
    @request.session[:user_id] = @user.id
    get :show, :id => @modalidade_pagamento.id
    assert_response :success

    assert_kind_of ModalidadePagamento, assigns(:modalidade_pagamento)
    assert_equal @modalidade_pagamento.id, assigns(:modalidade_pagamento).id
  end

  test "should show modalidade pagamento 1" do
    @request.session[:user_id] = @staff.id
    get :show, :id => @modalidade_pagamento.id
    assert_response :success

    assert_kind_of ModalidadePagamento, assigns(:modalidade_pagamento)
    assert_equal @modalidade_pagamento.id, assigns(:modalidade_pagamento).id
  end

  test "should show modalidade pagamento 2" do
    @request.session[:user_id] = @admin.id
    get :show, :id => @modalidade_pagamento.id
    assert_response :success

    assert_kind_of ModalidadePagamento, assigns(:modalidade_pagamento)
    assert_equal @modalidade_pagamento.id, assigns(:modalidade_pagamento).id
  end

  test "should not get edit 1" do
    get :edit, :id => @modalidade_pagamento.id
    assert_user_prohibition
  end

  test "should not get edit 2" do
    @request.session[:user_id] = @user.id
    get :edit, :id => @modalidade_pagamento.id
    assert_user_prohibition
  end

  test "should not get edit 3" do
    @request.session[:user_id] = @staff.id
    get :edit, :id => @modalidade_pagamento.id
    assert_user_prohibition
  end

  test "should get edit 1" do
    @request.session[:user_id] = @admin.id
    get :edit, :id => @modalidade_pagamento.id
    assert_response :success

    assert_kind_of ModalidadePagamento, assigns(:modalidade_pagamento)
    assert_equal @modalidade_pagamento.id, assigns(:modalidade_pagamento).id
  end

  test "should not update modalidade pagamento 1" do
    put :update, :id => @modalidade_pagamento.id, :modalidade_pagamento => {
      :preco => 59.0,
    }
    assert_user_prohibition
  end

  test "should not update modalidade pagamento 2" do
    @request.session[:user_id] = @user.id
    put :update, :id => @modalidade_pagamento.id, :modalidade_pagamento => {
      :preco => 59.0,
    }
    assert_user_prohibition
  end

  test "should not update modalidade pagamento 3" do
    @request.session[:user_id] = @staff.id
    put :update, :id => @modalidade_pagamento.id, :modalidade_pagamento => {
      :preco => 59.0,
    }
    assert_user_prohibition
  end

  test "should update modalidade pagamento 1" do
    @request.session[:user_id] = @admin.id
    put :update, :id => @modalidade_pagamento.id, :modalidade_pagamento => {
      :preco => 59.0,
    }

    assert_redirected_to modalidade_pagamento_path(assigns(:modalidade_pagamento))
    assert_equal 'Modalidade Pagamento alterada com sucesso.', flash[:success]
  end


#  test "should get index" do
#    get :index
#    assert_response :success
#    assert_not_nil assigns(:modalidade_pagamentos)
#  end
#
#  test "should get new" do
#    get :new
#    assert_response :success
#  end
#
#  test "should create modalidade_pagamento" do
#    assert_difference('ModalidadePagamento.count') do
#      post :create, :modalidade_pagamento => @modalidade_pagamento.attributes
#    end
#
#    assert_redirected_to modalidade_pagamento_path(assigns(:modalidade_pagamento))
#  end
#
#  test "should show modalidade_pagamento" do
#    get :show, :id => @modalidade_pagamento.to_param
#    assert_response :success
#  end
#
#  test "should get edit" do
#    get :edit, :id => @modalidade_pagamento.to_param
#    assert_response :success
#  end
#
#  test "should update modalidade_pagamento" do
#    put :update, :id => @modalidade_pagamento.to_param, :modalidade_pagamento => @modalidade_pagamento.attributes
#    assert_redirected_to modalidade_pagamento_path(assigns(:modalidade_pagamento))
#  end

  test "should not destroy modalidade pagamento 1" do
    assert_no_difference('ModalidadePagamento.count') do
      delete :destroy, :id => @modalidade_pagamento.id
    end
    assert_user_prohibition
  end

  test "should not destroy modalidade pagamento 2" do
    @request.session[:user_id] = @user.id
    assert_no_difference('ModalidadePagamento.count') do
      delete :destroy, :id => @modalidade_pagamento.id
    end
    assert_user_prohibition
  end

  test "should destroy modalidade pagamento 1" do
    @request.session[:user_id] = @staff.id
    assert_no_difference('ModalidadePagamento.count') do
      delete :destroy, :id => @modalidade_pagamento.id
    end
    assert_user_prohibition
  end

  test "should destroy modalidade pagamento 2" do
    @request.session[:user_id] = @admin.id
    assert_difference('ModalidadePagamento.count', -1) do
      delete :destroy, :id => @modalidade_pagamento.id
    end

    assert_redirected_to modalidade_pagamentos_path
    assert_equal 'Modalidade Pagamento apagada.', flash[:notice]
  end
end

