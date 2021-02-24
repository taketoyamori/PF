# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Commentモデルに関するテスト', type: :model do
  describe 'イベント情報の保存' do
    let(:user) { create(:user) }
    let(:event) { create(:event) }
    it "コメントが入力されている場合保存できるか" do
      expect(FactoryBot.create(:comment)).to be_valid
    end
  end
  context 'バリデーションチェック' do
    it 'コメントが空欄の場合保存できない' do
      expect(FactoryBot.build(:comment, comment:'')).to be_invalid
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Eventモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:event).macro).to eq :belongs_to
      end
    end
  end
end
