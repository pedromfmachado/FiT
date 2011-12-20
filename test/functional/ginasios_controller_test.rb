require 'test_helper'

class GinasiosControllerTest < ActionController::TestCase
  setup do
    @ginasio = ginasios(:dragao)
    @user = users(:andre_marinho)
    @staff = users(:valter)
    @admin = users(:pedro)
  end

  test "should not get index" do
    get :index
    assert_user_prohibition
  end

  test "should get index 1" do
    # get(action, params, session_vars, flash)

    @request.session[:user_id] = @user.id
    get :index
    assert_response :success
    assert_not_nil assigns(:ginasios)
  end

  test "should get index 2" do
    @request.session[:user_id] = @staff.id
    get :index
    assert_response :success
    assert_not_nil assigns(:ginasios)
  end

  test "should get index 3" do
    @request.session[:user_id] = @admin.id
    get :index
    assert_response :success
    assert_not_nil assigns(:ginasios)
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

  test "should get new" do
    @request.session[:user_id] = @admin.id
    get :new
    assert_response :success
    assert_not_nil assigns(:ginasio)
  end

  test "should not create ginasio 1" do
    # no login
    assert_no_difference('Ginasio.count') do
      post :create, :ginasio => {
        :nome => 'Solinca FEUP',
        :telefone => '213456789',
        :morada => 'Rua Dr. Roberto Frias, 4200 PORTO'
      }
    end
    assert_user_prohibition
  end

  test "should not create ginasio 2" do
    # ordinary user
    @request.session[:user_id] = @user.id
    assert_no_difference('Ginasio.count') do
      post :create, :ginasio => {
        :nome => 'Solinca FEUP',
        :telefone => '213456789',
        :morada => 'Rua Dr. Roberto Frias, 4200 PORTO'
      }
    end
    assert_user_prohibition
  end

  test "should not create ginasio 3" do
    # staff
    @request.session[:user_id] = @staff.id
    assert_no_difference('Ginasio.count') do
      post :create, :ginasio => {
        :nome => 'Solinca FEUP',
        :telefone => '213456789',
        :morada => 'Rua Dr. Roberto Frias, 4200 PORTO'
      }
    end
    assert_user_prohibition
  end

  test "should create ginasio" do
    # admin
    @request.session[:user_id] = @admin.id
    assert_difference('Ginasio.count') do
      post :create, :ginasio => {
        :nome => 'Solinca FEUP',
        :telefone => '213456789',
        :morada => 'Rua Dr. Roberto Frias, 4200 PORTO'
      }
    end

    assert_redirected_to ginasio_path(assigns(:ginasio))
    assert_equal 'Ginasio criado com sucesso!', flash[:success]
  end

  test "should not show ginasio" do
    get :show, :id => @ginasio.id
    assert_user_prohibition
  end

  test "should show ginasio 1" do
    @request.session[:user_id] = @user.id
    get :show, :id => @ginasio.id
    assert_response :success
    assert_kind_of Ginasio, assigns(:ginasio)
    assert_equal @ginasio.id, assigns(:ginasio).id
  end

  test "should show ginasio 2" do
    @request.session[:user_id] = @staff.id
    get :show, :id => @ginasio.id
    assert_response :success
    assert_kind_of Ginasio, assigns(:ginasio)
    assert_equal @ginasio.id, assigns(:ginasio).id
  end

  test "should show ginasio 3" do
    @request.session[:user_id] = @admin.id
    get :show, :id => @ginasio.id
    assert_response :success
    assert_kind_of Ginasio, assigns(:ginasio)
    assert_equal @ginasio.id, assigns(:ginasio).id
  end

  test "should not get edit 1" do
    get :edit, :id => @ginasio.id
    assert_user_prohibition
  end

  test "should not get edit 2" do
    @request.session[:user_id] = @user.id
    get :edit, :id => @ginasio.id
    assert_user_prohibition
  end

  test "should not get edit 3" do
    @request.session[:user_id] = @staff.id
    get :edit, :id => @ginasio.id
    assert_user_prohibition
  end

  test "should get edit" do
    @request.session[:user_id] = @admin.id
    get :edit, :id => @ginasio.id
    assert_response :success

    assert_kind_of Ginasio, assigns(:ginasio)
    assert_equal @ginasio.id, assigns(:ginasio).id
  end

  test "should not update ginasio 1" do
    put :update, :id => @ginasio.id, :ginasio => {
      :nome => "Solinca Dragão 2",
    }
    assert_user_prohibition
  end

  test "should not update ginasio 2" do
    @request.session[:user_id] = @user.id
    put :update, :id => @ginasio.id, :ginasio => {
      :nome => "Solinca Dragão 2",
    }
    assert_user_prohibition
  end

  test "should not update ginasio 3" do
    @request.session[:user_id] = @staff.id
    put :update, :id => @ginasio.id, :ginasio => {
      :nome => "Solinca Dragão 2",
    }
    assert_user_prohibition
  end

  test "should update ginasio" do
    @request.session[:user_id] = @admin.id
    put :update, :id => @ginasio.id, :ginasio => {
      :nome => "Solinca Dragão 2",
    }

    assert_redirected_to ginasio_path(assigns(:ginasio))
    assert_equal 'Dados do ginasio alterados com successo!', flash[:success]
  end

  test "should not destroy ginasio 1" do
    assert_no_difference('Ginasio.count') do
      delete :destroy, :id => @ginasio.id
    end
    assert_user_prohibition
  end

  test "should not destroy ginasio 2" do
    @request.session[:user_id] = @user.id
    assert_no_difference('Ginasio.count') do
      delete :destroy, :id => @ginasio.id
    end
    assert_user_prohibition
  end

  test "should not destroy ginasio 3" do
    @request.session[:user_id] = @staff.id
    assert_no_difference('Ginasio.count') do
      delete :destroy, :id => @ginasio.id
    end
    assert_user_prohibition
  end

  test "should destroy ginasio" do
    @request.session[:user_id] = @admin.id
    assert_difference('Ginasio.count', -1) do
      delete :destroy, :id => @ginasio.id
    end

    assert_redirected_to ginasios_path
    assert_equal 'Ginasio apagado.', flash[:notice]
  end
end

