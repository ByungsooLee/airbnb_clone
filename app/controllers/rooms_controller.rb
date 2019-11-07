class RoomsController < ApplicationController
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
      render :new
    end
  end

  def listing
    @room = Room.find(params[:id])
  end

  private
  def room_params
    params.require(:room).permit(:name, :price, :description, :location, :has_heating, :has_tv, :has_kichen, :has_internet, :has_aircon, :home_type, :room_type, :guest_count, :bedroom_count, :bathroom_count, :is_active)
  end
end
