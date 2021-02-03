# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Eventモデルに関するテスト', type: :model do
  describe 'イベント情報の保存' do
    let(:user) { create(:user) }
    let(:prefecture) { create(:prefecture) }
    it "有効なイベント情報が全て入力されている場合保存できるか" do
      expect(FactoryBot.create(:event)).to be_valid
    end
  end
  context 'バリデーションチェック' do
    it 'titleが空欄の場合保存できない' do
      Event.title = ''
      is_expected.to eq false
    end
    it 'イベント画像がない場合保存できない' do
      Event.image = ''
      is_expected.to eq false
    end
    it '開催地がない場合保存できない' do
      Event.prefecture_id = ''
      is_expected.to eq false
    end
    it '開催地がない場合保存できない' do
      Event.introduction = ''
      is_expected.to eq false
    end
    it '開催地がない場合保存できない' do
      Event.date = ''
      is_expected.to eq false
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Event.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'prefectureモデルとの関係' do
      it 'N:1となっている' do
        expect(Event.reflect_on_association(:prefecture).macro).to eq :belongs_to
      end
    end
  end
end
