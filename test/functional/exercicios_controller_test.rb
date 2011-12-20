require 'test_helper'

class ExerciciosControllerTest < ActionController::TestCase
  setup do
    @exercicio  = exercicios(:exercicio1)

    @user = users(:andre_alves)
    @staff = users(:goncalo)
    @admin = users(:pedro)

    @new_exercicio  = Exercicio.new(:nome => 'Wingardium Leviosa', :maquina => 'Sofás', :tipo => 'Aerobico')
  end

  teardown do
    @new_exercicio.destroy
  end

  test "should not get index" do
    get :index
    assert_user_prohibition
  end

  test "should not get index 1" do
    @request.session[:user_id] = @user.id
    get :index
    assert_user_prohibition
  end

  test "should get index 2" do
    @request.session[:user_id] = @staff.id
    get :index
    assert_response :success
    assert_not_nil assigns(:exercicios)
  end

  test "should get index 3" do
    @request.session[:user_id] = @admin.id
    get :index
    assert_response :success
    assert_not_nil assigns(:exercicios)
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

  test "should get new" do
    @request.session[:user_id] = @staff.id
    get :new
    assert_response :success
    assert_not_nil assigns(:exercicio)
  end

  test "should get new 1" do
    @request.session[:user_id] = @admin.id
    get :new
    assert_response :success
    assert_not_nil assigns(:exercicio)
  end

  test "should not create exercicio 1" do
    # no login
    assert_no_difference('Exercicio.count') do
      post :create, :exercicio => @new_exercicio.attributes
    end
    assert_user_prohibition
  end

  test "should not create exercicio 2" do
    # ordinary user
    @request.session[:user_id] = @user.id
    assert_no_difference('Exercicio.count') do
      post :create, :exercicio => @new_exercicio.attributes
    end
    assert_user_prohibition
  end

  test "should create exercicio" do
    # staff
    @request.session[:user_id] = @staff.id
    assert_difference('Exercicio.count') do
      post :create, :exercicio => @new_exercicio.attributes
    end

    assert_redirected_to exercicio_path(assigns(:exercicio))
    assert_equal 'Exercicio criado com sucesso.', flash[:success]
  end

  test "should create exercicio 1" do
    # admin
    @request.session[:user_id] = @admin.id
    assert_difference('Exercicio.count') do
      post :create, :exercicio => @new_exercicio.attributes
    end

    assert_redirected_to exercicio_path(assigns(:exercicio))
    assert_equal 'Exercicio criado com sucesso.', flash[:success]
  end

  test "should not show exercicio 1" do
    get :show, :id => @exercicio.id
    assert_user_prohibition
  end

  test "should not show exercicio 2" do
    @request.session[:user_id] = @user.id
    get :show, :id => @exercicio.id
    assert_user_prohibition
  end

  test "should show exercicio" do
    @request.session[:user_id] = @staff.id
    get :show, :id => @exercicio.id
    assert_response :success

    assert_kind_of Exercicio, assigns(:exercicio)
    assert_equal @exercicio.id, assigns(:exercicio).id
  end

  test "should show exercicio 1" do
    @request.session[:user_id] = @admin.id
    get :show, :id => @exercicio.id
    assert_response :success

    assert_kind_of Exercicio, assigns(:exercicio)
    assert_equal @exercicio.id, assigns(:exercicio).id
  end

  test "should not get edit 1" do
    get :edit, :id => @exercicio.id
    assert_user_prohibition
  end

  test "should not get edit 2" do
    @request.session[:user_id] = @user.id
    get :edit, :id => @exercicio.id
    assert_user_prohibition
  end

  test "should get edit" do
    @request.session[:user_id] = @staff.id
    get :edit, :id => @exercicio.id
    assert_response :success

    assert_kind_of Exercicio, assigns(:exercicio)
    assert_equal @exercicio.id, assigns(:exercicio).id
  end

  test "should get edit 1" do
    @request.session[:user_id] = @admin.id
    get :edit, :id => @exercicio.id
    assert_response :success

    assert_kind_of Exercicio, assigns(:exercicio)
    assert_equal @exercicio.id, assigns(:exercicio).id
  end

  test "should not update exercicio 1" do
    put :update, :id => @exercicio.id, :exercicio => {
      :nome => "Empurrar Caixas",
    }
    assert_user_prohibition
  end

  test "should not update exercicio 2" do
    @request.session[:user_id] = @user.id
    put :update, :id => @exercicio.id, :exercicio => {
      :nome => "Empurrar Caixas",
    }
    assert_user_prohibition
  end

  test "should update exercicio" do
    @request.session[:user_id] = @staff.id
    put :update, :id => @exercicio.id, :exercicio => {
      :nome => "Empurrar Caixas",
    }
    assert_redirected_to exercicio_path(assigns(:exercicio))
    assert_equal 'Exercicio alterado com sucesso.', flash[:success]
  end

  test "should update exercicio 1" do
    @request.session[:user_id] = @admin.id
    put :update, :id => @exercicio.id, :exercicio => {
      :nome => "Empurrar Caixas",
    }

    assert_redirected_to exercicio_path(assigns(:exercicio))
    assert_equal 'Exercicio alterado com sucesso.', flash[:success]
  end

  test "should not destroy exercicio 1" do
    assert_no_difference('Exercicio.count') do
      delete :destroy, :id => @exercicio.id
    end
    assert_user_prohibition
  end

  test "should not destroy exercicio 2" do
    @request.session[:user_id] = @user.id
    assert_no_difference('Exercicio.count') do
      delete :destroy, :id => @exercicio.id
    end
    assert_user_prohibition
  end

  test "should destroy exercicio" do
    @request.session[:user_id] = @staff.id
    assert_difference('Exercicio.count', -1) do
      delete :destroy, :id => @exercicio.id
    end

    assert_redirected_to exercicios_path
    assert_equal 'Exercicio apagado.', flash[:notice]
  end

  test "should destroy exercicio 1" do
    @request.session[:user_id] = @admin.id
    assert_difference('Exercicio.count', -1) do
      delete :destroy, :id => @exercicio.id
    end

    assert_redirected_to exercicios_path
    assert_equal 'Exercicio apagado.', flash[:notice]
  end
end

