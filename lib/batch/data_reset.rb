class Batch::DataReset
  def self.data_reset
    User.delete_all
    p "投稿を全て削除しました"
  end
end