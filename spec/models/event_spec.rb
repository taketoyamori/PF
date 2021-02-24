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
    it 'イベント名が空欄の場合保存できない' do
      expect(FactoryBot.build(:event, title:'')).to be_invalid
    end
    it 'イベント画像がない場合保存できない' do
      expect(FactoryBot.build(:event, event_image:'')).to be_invalid
    end
    it '開催地がない場合保存できない' do
      expect(FactoryBot.build(:event, prefecture_id:'')).to be_invalid
    end
    it 'イベント詳細情報がない場合保存できない' do
      expect(FactoryBot.build(:event, introduction:'')).to be_invalid
    end
    it '開催日時がない場合保存できない' do
      expect(FactoryBot.build(:event, date:'')).to be_invalid
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
