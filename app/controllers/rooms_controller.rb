class RoomsController < ApplicationController
  before_action :set_room, only: %i[show]
  before_action :set_index_info, only: %i[index]

  def index
    @rooms = Room.paginate_with_users(@page, @per_page)
  end

  def show; end

  private

  def room_params
    params.require(:room).permit(:address, :description,
                                 :fee, :latitude, :longitude,
                                 :image)
  end

  def index_info_params
    params.fetch(:indexing, {}).permit(:page, :per_page)
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def set_index_info
    @page = index_info_params['page'] || 1
    @per_page = index_info_params['per_page'] || 20
  end
end
