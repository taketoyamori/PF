# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Entryモデルに関するテスト', type: :model do
  describe 'エントリー情報の保存' do
    let(:user) { create(:user) }
    let(:room) { create(:room) }
    it "エントリー情報が入力されている場合保存できるか" do
      expect(FactoryBot.create(:entry)).to be_valid
    end
  end
  context 'バリデーションチェック' do
    it 'ユーザーのid情報が格納されてない場合保存できない' do
      expect(FactoryBot.build(:entry, user_id:'')).to be_invalid
    end
    it 'トークルームの情報が格納されてない場合保存できない' do
      expect(FactoryBot.build(:entry, room_id:'')).to be_invalid
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Entry.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Roomモデルとの関係' do
      it 'N:1となっている' do
        expect(Entry.reflect_on_association(:room).macro).to eq :belongs_to
      end
    end
  end
end