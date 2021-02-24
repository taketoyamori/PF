require 'rails_helper'

describe 'Homeコントローラー関係のテスト' do
  describe 'トップ画面(root_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'トップ画面がきちんと表示されているか表示されているか' do
        expect(page).to have_content 'admin-login'
      end
      it 'top_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
    context 'リンクの動作確認' do
      it 'Sign-upリンクが正しく作動するか' do
        click_link "Sign-up"
        expect(page).to have_current_path "/sign_up"
      end
      it 'Log-inリンクが正しく作動するか' do
        click_link "Log-in"
        expect(page).to have_current_path "/sign_in"
      end
      it 'Guest-loginリンクが正しく作動するか' do
        click_link "Guest-login"
        expect(page).to have_current_path "/events"
      end
      it 'admin-loginリンクが正しく作動するか' do
        click_link "admin-login"
        expect(page).to have_current_path "/admin/sign_in"
      end
    end
  end
end