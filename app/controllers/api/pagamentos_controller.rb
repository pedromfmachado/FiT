class Api::PagamentosController < ApiController
  def index

    @user = User.find_by_token(params[:token])
    respond_with Pagamento.where(:user_id => @user.id, :ano => Time.now.year)

  end

  skip_before_filter :verify_authenticity_token

end
