class RoomsController < ApplicationController
  def new
    @room = current_user.rooms.build
  end
end
