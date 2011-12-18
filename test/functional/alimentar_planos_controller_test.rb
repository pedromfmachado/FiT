require 'test_helper'

class AlimentarPlanosControllerTest < ActionController::TestCase
  setup do
    @alimentar_plano = alimentar_planos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alimentar_planos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alimentar_plano" do
    assert_difference('AlimentarPlano.count') do
      post :create, :alimentar_plano => @alimentar_plano.attributes
    end

    assert_redirected_to alimentar_plano_path(assigns(:alimentar_plano))
  end

  test "should show alimentar_plano" do
    get :show, :id => @alimentar_plano.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @alimentar_plano.to_param
    assert_response :success
  end

  test "should update alimentar_plano" do
    put :update, :id => @alimentar_plano.to_param, :alimentar_plano => @alimentar_plano.attributes
    assert_redirected_to alimentar_plano_path(assigns(:alimentar_plano))
  end

  test "should destroy alimentar_plano" do
    assert_difference('AlimentarPlano.count', -1) do
      delete :destroy, :id => @alimentar_plano.to_param
    end

    assert_redirected_to alimentar_planos_path
  end
end
