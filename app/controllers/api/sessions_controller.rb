class Api::SessionsController < Api::ApiController
  def create
    @user = User.authenticate(params[:session][:email], params[:session][:password])

    if @user
      session[:user_id] = @user.id
      render json: @user, each_serializer: UserSerializer
    else
      render json: @user.errors, status: :error
    end
  end

  def destroy
    session[:user_id] = nil
    head :no_content
  end
end
