class Api::UsersController < Api::ApiController
  def index
    @users = User.all

    render json: @users, each_serializer: UserSerializer
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :ok, location: [:api, @user], each_serializer: UserSerializer
    else
      render json: @user.errors, status: :error
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      head :no_content
    else
      render status: :error
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
