require 'test_helper'

class PlanosControllerTest < ActionController::TestCase
  setup do
    @plano = planos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plano" do
    assert_difference('Plano.count') do
      post :create, :plano => @plano.attributes
    end

    assert_redirected_to plano_path(assigns(:plano))
  end

  test "should show plano" do
    get :show, :id => @plano.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @plano.to_param
    assert_response :success
  end

  test "should update plano" do
    put :update, :id => @plano.to_param, :plano => @plano.attributes
    assert_redirected_to plano_path(assigns(:plano))
  end

  test "should destroy plano" do
    assert_difference('Plano.count', -1) do
      delete :destroy, :id => @plano.to_param
    end

    assert_redirected_to planos_path
  end
end
