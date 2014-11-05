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

    if @item.save
      render json: @item, status: :created, location: @item, each_serializer: ItemSerializer
    else
      render @item.errors, status: :unprocessable_entry
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
    params.require(:item).permit(:description, :list_id)
  end
end
