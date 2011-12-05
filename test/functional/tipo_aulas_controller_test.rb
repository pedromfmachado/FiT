require 'test_helper'

class TipoAulasControllerTest < ActionController::TestCase
  setup do
    @tipo_aula = tipo_aulas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_aulas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_aula" do
    assert_difference('TipoAula.count') do
      post :create, :tipo_aula => @tipo_aula.attributes
    end

    assert_redirected_to tipo_aula_path(assigns(:tipo_aula))
  end

  test "should show tipo_aula" do
    get :show, :id => @tipo_aula.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tipo_aula.to_param
    assert_response :success
  end

  test "should update tipo_aula" do
    put :update, :id => @tipo_aula.to_param, :tipo_aula => @tipo_aula.attributes
    assert_redirected_to tipo_aula_path(assigns(:tipo_aula))
  end

  test "should destroy tipo_aula" do
    assert_difference('TipoAula.count', -1) do
      delete :destroy, :id => @tipo_aula.to_param
    end

    assert_redirected_to tipo_aulas_path
  end
end
