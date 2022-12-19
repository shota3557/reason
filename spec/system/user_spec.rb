require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  describe '登録機能' do
    context 'ユーザを登録した場合' do
      it '新規登録ができる' do
        visit new_user_registration_path
        fill_in "user[name]", with: 'test'
        fill_in "user[email]", with: 'test@test.com'
        fill_in "user[password]", with: "testtest"
        fill_in "user[password_confirmation]", with: "testtest"
        click_button '登録する'
        expect(page).to have_content 'アカウント登録が完了しました'
      end
    end
  end  
  
  describe 'ログイン機能' do
    context '登録済みのユーザでログインした場合' do
      it 'ログインし、トップページに飛べること' do
        visit new_user_session_path
        fill_in "user[email]", with: 'test1@example.com'
        fill_in "user[password]", with: 'testtest'
        click_button 'ログインする'
        expect(page).to have_content 'ログインしました'
      end
    end  
      
    context '登録済みのユーザでログインした場合' do
      it '自分の詳細画面にアクセスできる' do
        user = FactoryBot.create(:user, name: 'Taro', email: 'test@example.com')
        visit new_user_session_path
        fill_in "user[email]", with: 'test@example.com'
        fill_in "user[password]", with: 'testtest'
        click_button 'ログインする'
        visit user_path(user.id)
        expect(page).to have_content 'Taroのページ'
      end
    end  
      
    context '登録済みのユーザでログインした場合' do
      it '編集画面で自分の名前を変更できる' do
        user = FactoryBot.create(:user, email: 'test@example.com')
        visit new_user_session_path
        fill_in "user[email]", with: 'test@example.com'
        fill_in "user[password]", with: 'testtest'
        click_button 'ログインする'
        visit edit_user_registration_path(user.id)
        fill_in "user[name]", with: 'user2'
        fill_in "user[password]", with: 'testtest'
        fill_in "user[password_confirmation]", with: 'testtest'
        fill_in "user[current_password]", with: 'testtest'
        click_button '情報を更新する'
        expect(page).to have_content 'user2のページ'
      end
    end
  end   
      
  describe '管理者機能' do
    context '管理者でログインした場合' do
      it '登録者一覧が表示される' do
        user = FactoryBot.create(:user, email: 'test@example.com')
        visit new_user_session_path
        fill_in "user[email]", with: 'test@example.com'
        fill_in "user[password]", with: 'testtest'
        click_button 'ログインする'
        visit users_admin_guest_sign_in_path
        visit users_path
        expect(page).to have_content '登録者一覧'
      end
    end 

    context '管理者でログインした場合' do
        it 'ユーザを削除することができる' do
          user = FactoryBot.create(:user, email: 'test@example.com')
          visit new_user_session_path
          fill_in "user[email]", with: 'test@example.com'
          fill_in "user[password]", with: 'testtest'
          click_button 'ログインする'
          visit users_admin_guest_sign_in_path
          visit users_path
          click_on '削除する'
          page.driver.browser.switch_to.alert.accept
          expect { expect(page).to have_content "ユーザを削除しました" }  
        end
      end

    context '一般ユーザがユーザ一覧画面にアクセスした場合' do
      it '管理画面にアクセスできない' do
        user = FactoryBot.create(:second_user, email: 'test@example2.com')
        visit new_user_session_path
        fill_in "user[email]", with: 'test@example2.com'
        fill_in "user[password]", with: 'testtest'
        click_button 'ログインする'
        visit users_admin_guest_sign_in_path
        visit users_path
        expect(page).to have_content '管理者以外アクセスできません'
      end
    end  
  end  
end