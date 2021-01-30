class RoomsController < ApplicationController

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  # ルートパスはこのアクション
  def index
  end

  def destroy
    room = Room.find(params[:id]) # ビューで変数を使わないから@不要
    room.destroy
    redirect_to root_path
  end

  private

    def room_params
      params.require(:room).permit(:name, user_ids: [])
    end

end
