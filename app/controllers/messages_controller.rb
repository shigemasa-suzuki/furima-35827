class MessagesController < ApplicationController
  
  def create
    @item = Item.find(params[:item_id])
    @message = Message.new(text_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

    private

    def text_params
      params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
    end
end
