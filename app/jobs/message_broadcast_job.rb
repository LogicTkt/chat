class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room_channel_#{message.room.id}", message: render_message(message)
  end

  private
    def render_message(message)
      { id: message.id, content: message.content }
    end
end
