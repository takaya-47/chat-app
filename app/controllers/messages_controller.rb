class MessagesController < ApplicationController

  def index
    @room = Room.find(params[:room_id]) # URLに含まれるroom_idを利用してキー「room_id」の値をparamsを通して受け取っている。
    @message = Message.new
  end

  def create
    @room = Room.find(params[:room_id]) # URLに含まれるroom_idを利用してキー「room_id」の値をparamsを通して受け取っている。
    @message = @room.messages.new(messasge_params) # ルームに紐付いたメッセージを生成
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render "index"
    end
  end

  private
    def messasge_params
      params.require(:message).permit(:content).merge(user_id: current_user.id)
    end

end
