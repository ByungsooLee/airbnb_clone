class RoomsController < ApplicationController

  before_action :room_find, only: [:listing, :pricing, :description, :photos, :amenities, :location, :show, :preload, :preview]

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = 'New room registered'
      redirect_to listing_room_path(@room), notice: "Saved..."
    else
      flash[:alert] = "Something went wrong..."
      render "new"
    end
  end

  def update
    @room = Room.find(params[:id])

    final_params = (is_ready?(@room) ? room_params.merge(is_active: true) : room_params)

    if @room.update(final_params)
      flash[:notice] = 'Saved'
      redirect_back(fallback_location: request.referer)
    else
      flash[:alert] = "Something went wrong..."
      render "new"
    end
  end

  def show
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photos
    @photos = @room.photos
  end

  def amenities
  end

  def location
  end
  
  def preload
    today = Date.today
    reservations = @room.reservations.where("start_date >= ? OR end_date >= ?", today, today)

    render json: reservations
  end

  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    output = {
      conflict: has_conflict(start_date, end_date, @room)
    }

    render json: output
  end

  private

  def has_conflict(start_date, end_date, room)
    check = room.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
    check.size > 0 ? true : false
  end

  def room_find
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :price, :description, :summary, :address, :picture, :has_heating, :has_tv, :has_kichen, :has_internet, :has_aircon, :home_type, :room_type, :guest_count, :bedroom_count, :bathroom_count, :is_active)
  end

end
