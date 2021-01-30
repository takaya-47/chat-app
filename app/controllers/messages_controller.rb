class MessagesController < ApplicationController

  def index
    @room = Room.find(params[:room_id]) # URLに含まれるroom_idを利用してキー「room_id」の値をparamsを通して受け取っている。
    @message = Message.new
    @messages = @room.messages.includes(:user) # N+1問題を解決するためincludesを使用してusersテーブルをまるごと検索してくる
  end

  def create
    @room = Room.find(params[:room_id]) # URLに含まれるroom_idを利用してキー「room_id」の値をparamsを通して受け取っている。
    @message = @room.messages.new(messasge_params) # ルームに紐付いたメッセージを生成
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user) # N+1問題を解決するためincludesを使用してusersテーブルをまるごと検索してくる
      render :index # "index"
    end
  end

  private
    def messasge_params
      params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
    end

end
