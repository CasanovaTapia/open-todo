class Api::ListsController < Api::ApiController
  def index
    @lists = List.all
    render json: @lists, each_serializer: ListSerializer
  end

  def show
    @list = List.find(params[:id])
    render json: @list
  end

  def create
    @user = User.find(params[:user_id])
    @list = List.new(list_params)
    @list.user_id = @user.id

    if @list.save
      render json: @list, status: :created, location: @list, each_serializer: ListSerializer
    else
      render json: @list.errors, status: :unprocessable_entry
    end
  end

  def update
    @list = List.find(params[:id])

    if @list.update_attributes(list_params)
      render json: @list, status: :updated, each_serializer: ListSerializer
    else
      render json: @list.errors, status: :unprocessable_entry
    end
  end

  def destroy
    @list = List.find(params[:id])

    if @list.destroy
      head :no_content
    else
      render status: 500
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :user_id, :permissions)
  end
end
