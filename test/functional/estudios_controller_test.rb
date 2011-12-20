require 'test_helper'

class EstudiosControllerTest < ActionController::TestCase
  setup do
    @estudio = estudios(:estudio_pequeno)

    @user = users(:andre_marinho)
    @staff = users(:valter)
    @admin = users(:pedro)
  end

  test "should not get index" do
    get :index, :ginasio_id => @estudio.ginasio_id
    assert_user_prohibition
  end

  test "should get index 1" do
    @request.session[:user_id] = @user.id
    get :index, :ginasio_id => @estudio.ginasio_id
    assert_response :success
    assert_not_nil assigns(:estudios)
  end

  test "should get index 2" do
    @request.session[:user_id] = @staff.id
    get :index, @estudio.ginasio_id
    assert_response :success
    assert_not_nil assigns(:estudios)
  end

  test "should get index 3" do
    @request.session[:user_id] = @admin.id
    get :index, @estudio.ginasio_id
    assert_response :success
    assert_not_nil assigns(:estudios)
  end
  test "should get index" do
    get :index, @estudio.ginasio_id
    assert_response :success
    assert_not_nil assigns(:estudios)
  end

#  test "should get new" do
#    get :new
#   assert_response :success
#  end
#
#  test "should create estudio" do
#    assert_difference('Estudio.count') do
#      post :create, :estudio => @estudio.attributes
#    end
#
#    assert_redirected_to estudio_path(assigns(:estudio))
#  end
#
#  test "should show estudio" do
#    get :show, :id => @estudio.to_param
#    assert_response :success
#  end
#
#  test "should get edit" do
#    get :edit, :id => @estudio.to_param
#    assert_response :success
#  end
#
#  test "should update estudio" do
#    put :update, :id => @estudio.to_param, :estudio => @estudio.attributes
#    assert_redirected_to estudio_path(assigns(:estudio))
#  end
#
#  test "should destroy estudio" do
#    assert_difference('Estudio.count', -1) do
#      delete :destroy, :id => @estudio.to_param
#    end
#
#    assert_redirected_to estudios_path
#  end
end

