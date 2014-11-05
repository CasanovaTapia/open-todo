class Api::SessionsController < Api::ApiController
  def create
    @user = User.authenticate(params[:session][:email], params[:session][:password])

    if @user
      session[:user_id] = @user.id
      render  :status => 200,
              :json => {
                :success => "Logged in",
      :user => @user
    }
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    head :no_content
  end
end
