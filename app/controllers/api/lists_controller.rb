class Api::ListsController < Api::ApiController
  before_filter :authenticate_user, only: [:show, :index]

  def index
    @lists = List.all
    render json: @lists, each_serializer: ListSerializer
    authorize @lists, :index_api?
  end

  def show
    @list = List.find(params[:id])
    render json: @list
    authorize @list, :show_api?
  end

  def create
    @user = User.find(params[:user_id])
    @list = List.new(list_params)
    @list.user_id = @user.id

    if @list.save
      render json: @list, status: :created, location: [:api, @list.user, @list], each_serializer: ListSerializer
    else
      render json: @list.errors, status: :error
    end
  end

  def update
    @list = List.find(params[:id])

    if @list.update_attributes(list_params)
      render json: @list, status: :ok, each_serializer: ListSerializer
    else
      render json: @list.errors, status: :error
    end
  end

  def destroy
    @list = List.find(params[:id])

    if @list.destroy
      head :no_content
    else
      render status: :error
    end
  end

  private

  def authenticate_user
    @user = User.find(params[:user_id])
    User.authenticate(@user.email, params[:password])
  end

  def list_params
    params.permit(:name, :user_id, :permissions)
  end
end
