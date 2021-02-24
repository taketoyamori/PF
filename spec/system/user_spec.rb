require 'rails_helper'

describe 'controller/Usersフォルダ関係のテスト' do
  describe 'user新規登録画面(new_user_registration_path)のテスト' do
    before do
      visit new_user_registration_path
    end
    context '新規登録画面関係のテスト' do
      it '新規登録画面(new_user_registration_path)に「Sign up」が表示されているか' do
        expect(page).to have_content 'Sign up'
      end
      it 'new_user_registration_pathが"/sign_up"であるか' do
        expect(current_path).to eq('/sign_up')
      end
      it '新規登録が正常に行えるか' do
        fill_in 'user[name]', with: Faker::Name.name
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[age]', with: 25
        fill_in 'user[instagram]', with: "https://www.instagram.com"
        fill_in 'user[twitter]', with: "https://twitter.com/"
        fill_in 'user[line]', with: Faker::Lorem.characters(number:7)
        fill_in 'user[introduction]', with: Faker::Lorem.characters(number:20)
        fill_in 'user[password]', with: "password"
        fill_in 'user[password_confirmation]', with: "password"
        #新規登録ユーザー情報を入力後SignUpボタンを押下
        click_button "Sign up"
        #新規登録されたユーザーの詳細情報ページへ移動する
        expect(page).to have_current_path(('/persons/' + User.last.id.to_s))
      end
    end
  end

  describe 'userログイン画面(new_user_session_path)のテスト' do
    before do
      FactoryBot.create(:user)
      visit new_user_session_path
    end
    context 'ログイン画面関係のテスト' do
      it 'ログイン画面(new_user_session_path)に「Log in」が表示されているか' do
        expect(page).to have_content 'Log in'
      end
      it 'new_user_registration_pathが"/sign_in"であるか' do
        expect(current_path).to eq('/sign_in')
      end
    end
  end
end