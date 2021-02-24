# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Prefectureモデルに関するテスト", type: :model do
  describe '県名情報を保存' do
    it "県名情報が入力されている場合保存できるか" do
      expect(FactoryBot.create(:prefecture)).to be_valid
    end
  end
end