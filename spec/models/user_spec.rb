# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Userモデルに関するテスト", type: :model do
  describe 'User情報を保存' do
    it "有効なユーザー情報が全て入力されている場合保存できるか" do
      expect(FactoryBot.create(:user)).to be_valid
    end
  end
  context "バリデーションチェック" do
	  it "名前がなければ保存できない" do
	    expect(FactoryBot.build(:user, name:'')).to be_invalid
	  end
	  it "名前が20文字以下なら保存できる" do
	    expect(FactoryBot.build(:user, name: Faker::Lorem.characters(number: 20))).to be_valid
	  end
	  it "名前が20文字以上なら保存できない" do
	    expect(FactoryBot.build(:user, name: Faker::Lorem.characters(number: 21))).to be_invalid
	  end
	  it "年齢が未入力なら保存できない" do
	    expect(FactoryBot.build(:user, age:'')).to be_invalid
	  end
	  it "メールアドレスがなければ保存できない" do
	    expect(FactoryBot.build(:user, email:'')).to be_invalid
	  end
	  it "メールアドレスが重複していれば保存できない" do
      user1 = expect(FactoryBot.create(:user, email:'test@gmail.com'))
      expect(FactoryBot.build(:user, email:'test@gmail.com')).to be_invalid
    end
    it "パスワードがなければ保存できない" do
	    expect(FactoryBot.build(:user, password:'')).to be_invalid
	  end
	end
end