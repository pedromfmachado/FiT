require 'test_helper'

class GinasiosControllerTest < ActionController::TestCase
  setup do
    @ginasio = ginasios(:dragao)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ginasios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ginasio" do
    assert_difference('Ginasio.count') do
      post :create, :ginasio => @ginasio.attributes
    end

    assert_redirected_to ginasio_path(assigns(:ginasio))
  end

  test "should show ginasio" do
    get :show, :id => @ginasio.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ginasio.to_param
    assert_response :success
  end

  test "should update ginasio" do
    put :update, :id => @ginasio.to_param, :ginasio => @ginasio.attributes
    assert_redirected_to ginasio_path(assigns(:ginasio))
  end

  test "should destroy ginasio" do
    assert_difference('Ginasio.count', -1) do
      delete :destroy, :id => @ginasio.to_param
    end

    assert_redirected_to ginasios_path
  end
end
