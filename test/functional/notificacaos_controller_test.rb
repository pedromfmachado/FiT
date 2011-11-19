require 'test_helper'

class NotificacaosControllerTest < ActionController::TestCase
  setup do
    @notificacao = notificacaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notificacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notificacao" do
    assert_difference('Notificacao.count') do
      post :create, :notificacao => @notificacao.attributes
    end

    assert_redirected_to notificacao_path(assigns(:notificacao))
  end

  test "should show notificacao" do
    get :show, :id => @notificacao.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @notificacao.to_param
    assert_response :success
  end

  test "should update notificacao" do
    put :update, :id => @notificacao.to_param, :notificacao => @notificacao.attributes
    assert_redirected_to notificacao_path(assigns(:notificacao))
  end

  test "should destroy notificacao" do
    assert_difference('Notificacao.count', -1) do
      delete :destroy, :id => @notificacao.to_param
    end

    assert_redirected_to notificacaos_path
  end
end
