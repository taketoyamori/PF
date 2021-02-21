# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Reportモデルに関するテスト", type: :model do
  describe '通報者、違反者情報を保存' do
    let(:violator) { create(:user) }
    let(:reporter) { create(:user) }
    it "通報者、違反者情報が全て入力されている場合保存できるか" do
      expect(FactoryBot.create(:report, violator: violator, reporter: reporter)).to be_valid
    end
  end
  context "バリデーションチェック" do
	  it "違反者情報がなければ保存できない" do
	    expect(FactoryBot.build(:report, violator_id:'')).to be_invalid
	  end
	  it "通報者情報がなければ保存できない" do
	    expect(FactoryBot.build(:report, reporter_id:'')).to be_invalid
	  end
	end
end