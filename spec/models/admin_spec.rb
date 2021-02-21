# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Adminモデルに関するテスト", type: :model do
  describe 'Admin情報を保存' do
    it "有効な管理者情報が全て入力されている場合保存できるか" do
      expect(FactoryBot.create(:admin)).to be_valid
    end
  end
  context "バリデーションチェック" do
	  it "メールアドレスがなければ保存できない" do
	    expect(FactoryBot.build(:admin, email:'')).to be_invalid
    end
    it "パスワードがなければ保存できない" do
	    expect(FactoryBot.build(:admin, password:'')).to be_invalid
	  end
	end
end