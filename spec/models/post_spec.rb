# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Postモデルに関するテスト', type: :model do
  describe 'ブログ記事の保存' do
    let(:admin) { create(:admin) }
    it "有効なブログ記事情報が全て入力されている場合保存できるか" do
      expect(FactoryBot.create(:post)).to be_valid
    end
  end
  context 'バリデーションチェック' do
    it '記事タイトルが空欄の場合保存できない' do
      expect(FactoryBot.build(:post, title:'')).to be_invalid
    end
    it 'ブログ画像がない場合保存できない' do
      expect(FactoryBot.build(:post, post_image:'')).to be_invalid
    end
    it 'ブログ記事本文がない場合保存できない' do
      expect(FactoryBot.build(:post, body:'')).to be_invalid
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Adminモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:admin).macro).to eq :belongs_to
      end
    end
  end
end
