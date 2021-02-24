# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messageモデルに関するテスト', type: :model do
  describe 'イベント情報の保存' do
    let(:user) { create(:user) }
    let(:room) { create(:room) }
    it "メッセージが入力されている場合保存できるか" do
      expect(FactoryBot.create(:message)).to be_valid
    end
  end
  context 'バリデーションチェック' do
    it 'メッセージが空欄の場合保存できない' do
      expect(FactoryBot.build(:message, message:'')).to be_invalid
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Message.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Roomモデルとの関係' do
      it 'N:1となっている' do
        expect(Message.reflect_on_association(:room).macro).to eq :belongs_to
      end
    end
  end
end