class Api::UsersController < Api::ApiController
  def index
    @users = User.all

    render json: @users, each_serializer: UserSerializer
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user, each_serializer: UserSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
