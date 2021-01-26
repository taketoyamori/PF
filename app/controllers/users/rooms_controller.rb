class Users::RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.create
    entry1 = Entry.create(room_id: room.id, user_id: current_user.id)
    entry2 = Entry.create(user_id: params[:entry][:user_id], room_id: room.id)
    redirect_to room_path(room)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
    @entries = @room.entries
  end

  def index
    current_entries = current_user.entries
    my_room_ids = []
    current_entries.each do |entry|
      my_room_ids << entry.room.id
    end
    @another_entries = Entry.where(room_id: my_room_ids).where.not(user_id: current_user.id)
  end

end

#indexアクションの処理について理解を忘れそうなのでメモ
#19行/ ローカル変数へcurrent_userが持っているエントリーモデルのデータをいれる
#20行/ my_room_idsに配列作成用の空の[]を用意
#22行/ 先ほど用意した配列化用の[]を持った変数にcurrent_userが関係しているエントリーモデルのroomidのみ入れ、配列化完了
#24行/ 配列に入ったroom.idを元に、そのidに関係する自分以外のユーザー情報を採取する