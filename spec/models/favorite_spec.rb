# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favoriteモデルに関するテスト', type: :model do
  describe 'エントリー情報の保存' do
    let(:user) { create(:user) }
    let(:event) { create(:event) }
    it "エントリー情報が入力されている場合保存できるか" do
      expect(FactoryBot.create(:favorite)).to be_valid
    end
  end
  context 'バリデーションチェック' do
    it 'ユーザーのid情報が格納されてない場合保存できない' do
      expect(FactoryBot.build(:favorite, user_id:'')).to be_invalid
    end
    it 'イベントの情報が格納されてない場合保存できない' do
      expect(FactoryBot.build(:favorite, event_id:'')).to be_invalid
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Eventモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:event).macro).to eq :belongs_to
      end
    end
  end
end