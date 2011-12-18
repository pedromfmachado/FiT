require 'test_helper'

class PagamentoControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get confirmar" do
    get :confirmar
    assert_response :success
  end

end
