require 'test_helper'

class EstudiosControllerTest < ActionController::TestCase
  setup do
    @estudio = estudios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estudios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estudio" do
    assert_difference('Estudio.count') do
      post :create, :estudio => @estudio.attributes
    end

    assert_redirected_to estudio_path(assigns(:estudio))
  end

  test "should show estudio" do
    get :show, :id => @estudio.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @estudio.to_param
    assert_response :success
  end

  test "should update estudio" do
    put :update, :id => @estudio.to_param, :estudio => @estudio.attributes
    assert_redirected_to estudio_path(assigns(:estudio))
  end

  test "should destroy estudio" do
    assert_difference('Estudio.count', -1) do
      delete :destroy, :id => @estudio.to_param
    end

    assert_redirected_to estudios_path
  end
end
