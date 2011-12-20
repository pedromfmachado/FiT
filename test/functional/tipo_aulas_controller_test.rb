require 'test_helper'

class TipoAulasControllerTest < ActionController::TestCase
  setup do
    @tipo_aula = tipo_aulas(:aerobica)

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
    assert_not_nil assigns(:tipo_aulas)
  end

  test "should get index 2" do
    @request.session[:user_id] = @staff.id
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_aulas)
  end

  test "should get index 3" do
    @request.session[:user_id] = @admin.id
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_aulas)
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
    assert_not_nil assigns(:tipo_aula)
  end

  test "should get new 1" do
    @request.session[:user_id] = @admin.id
    get :new
    assert_response :success
    assert_not_nil assigns(:tipo_aula)
  end

  test "should not create tipo aula 1" do
    # no login
    assert_no_difference('TipoAula.count') do
      post :create, :tipo_aula => {
        :tipo => "HidroPush",
        :descricao => "Descricao generica aqui"
      }
    end
    assert_user_prohibition
  end

  test "should not create tipo aula 2" do
    # ordinary user
    @request.session[:user_id] = @user.id
    assert_no_difference('TipoAula.count') do
      post :create, :tipo_aula => {
        :tipo => "HidroPush",
        :descricao => "Descricao generica aqui"
      }
    end
    assert_user_prohibition
  end

  test "should create tipo aula" do
    # staff
    @request.session[:user_id] = @staff.id
    assert_difference('TipoAula.count') do
      post :create, :tipo_aula => {
        :tipo => "HidroPush",
        :descricao => "Descricao generica aqui"
      }
    end

    assert_redirected_to tipo_aula_path(assigns(:tipo_aula))
    assert_equal 'Tipo de aula (modalidade) criado com sucesso.', flash[:success]
  end

  test "should create tipo aula 1" do
    # admin
    @request.session[:user_id] = @admin.id
    assert_difference('TipoAula.count') do
      post :create, :tipo_aula => {
        :tipo => "HidroPush",
        :descricao => "Descricao generica aqui"
      }
    end

    assert_redirected_to tipo_aula_path(assigns(:tipo_aula))
    assert_equal 'Tipo de aula (modalidade) criado com sucesso.', flash[:success]
  end

  test "should not show tipo aula 1" do
    get :show, :id => @tipo_aula.id
    assert_user_prohibition
  end

  test "should show tipo aula" do
    @request.session[:user_id] = @user.id
    get :show, :id => @tipo_aula.id
    assert_response :success

    assert_kind_of TipoAula, assigns(:tipo_aula)
    assert_equal @tipo_aula.id, assigns(:tipo_aula).id
  end

  test "should show tipo aula 1" do
    @request.session[:user_id] = @staff.id
    get :show, :id => @tipo_aula.id
    assert_response :success

    assert_kind_of TipoAula, assigns(:tipo_aula)
    assert_equal @tipo_aula.id, assigns(:tipo_aula).id
  end

  test "should show tipo aula 2" do
    @request.session[:user_id] = @admin.id
    get :show, :id => @tipo_aula.id
    assert_response :success

    assert_kind_of TipoAula, assigns(:tipo_aula)
    assert_equal @tipo_aula.id, assigns(:tipo_aula).id
  end

  test "should not get edit 1" do
    get :edit, :id => @tipo_aula.id
    assert_user_prohibition
  end

  test "should not get edit 2" do
    @request.session[:user_id] = @user.id
    get :edit, :id => @tipo_aula.id
    assert_user_prohibition
  end

  test "should get edit" do
    @request.session[:user_id] = @staff.id
    get :edit, :id => @tipo_aula.id
    assert_response :success

    assert_kind_of TipoAula, assigns(:tipo_aula)
    assert_equal @tipo_aula.id, assigns(:tipo_aula).id
  end

  test "should get edit 1" do
    @request.session[:user_id] = @admin.id
    get :edit, :id => @tipo_aula.id
    assert_response :success

    assert_kind_of TipoAula, assigns(:tipo_aula)
    assert_equal @tipo_aula.id, assigns(:tipo_aula).id
  end

  test "should not update tipo aula 1" do
    put :update, :id => @tipo_aula.id, :tipo_aula => {
      :tipo => "Empurrar Caixas",
    }
    assert_user_prohibition
  end

  test "should not update tipo aula 2" do
    @request.session[:user_id] = @user.id
    put :update, :id => @tipo_aula.id, :tipo_aula => {
      :tipo => "Empurrar Caixas",
    }
    assert_user_prohibition
  end

  test "should update tipo aula" do
    @request.session[:user_id] = @staff.id
    put :update, :id => @tipo_aula.id, :tipo_aula => {
      :tipo => "Empurrar Caixas",
    }
    assert_redirected_to tipo_aula_path(assigns(:tipo_aula))
    assert_equal 'Tipo de aula (modalidade) alterado com sucesso.', flash[:success]
  end

  test "should update tipo aula 1" do
    @request.session[:user_id] = @admin.id
    put :update, :id => @tipo_aula.id, :tipo_aula => {
      :tipo => "Empurrar Caixas",
    }

    assert_redirected_to tipo_aula_path(assigns(:tipo_aula))
    assert_equal 'Tipo de aula (modalidade) alterado com sucesso.', flash[:success]
  end

  test "should not destroy tipo aula 1" do
    assert_no_difference('TipoAula.count') do
      delete :destroy, :id => @tipo_aula.id
    end
    assert_user_prohibition
  end

  test "should not destroy tipo aula 2" do
    @request.session[:user_id] = @user.id
    assert_no_difference('TipoAula.count') do
      delete :destroy, :id => @tipo_aula.id
    end
    assert_user_prohibition
  end

  test "should destroy tipo aula" do
    @request.session[:user_id] = @staff.id
    assert_difference('TipoAula.count', -1) do
      delete :destroy, :id => @tipo_aula.id
    end

    assert_redirected_to tipo_aulas_path
    assert_equal 'Tipo Aula apagado.', flash[:notice]
  end

  test "should destroy tipo aula 1" do
    @request.session[:user_id] = @admin.id
    assert_difference('TipoAula.count', -1) do
      delete :destroy, :id => @tipo_aula.id
    end

    assert_redirected_to tipo_aulas_path
    assert_equal 'Tipo Aula apagado.', flash[:notice]
  end

end
