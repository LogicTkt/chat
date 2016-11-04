class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.all
    gon.messages = @messages.map{ |message|
      { id: message.id, content: message.content}
    }
  end
end
