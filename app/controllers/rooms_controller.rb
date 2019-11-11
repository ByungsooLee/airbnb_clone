class RoomsController < ApplicationController

  before_action :room_find, only: [:listing, :pricing, :description, :photos, :amenities, :location]


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

  def listing
  end

  def pricing
  end

  def description
  end

  def photos
  end

  def amenities
  end

  def location
  end

  private
  def room_find
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :price, :description, :summary, :location, :picture, :has_heating, :has_tv, :has_kichen, :has_internet, :has_aircon, :home_type, :room_type, :guest_count, :bedroom_count, :bathroom_count, :is_active)
  end

end
