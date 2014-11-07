class Api::ItemsController < Api::ApiController
  def index
    @list = List.find(params[:list_id])
    @items = @list.items

    render json: @items
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.new(item_params)
    @item.list_id = @list.id
    @item.user_id = @list.user_id

    if @item.save
      render json: @item, status: :ok, location: [:api, @item.list, @item], each_serializer: ItemSerializer
    else
      render @item.errors, status: :error
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      head :no_content
    else
      render status: 500
    end
  end

  private

  def item_params
    params.permit(:description, :list_id)
  end
end
