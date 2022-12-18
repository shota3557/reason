require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe do
    before do
      visit new_user_session_path 
      fill_in "user[email]", with: 'test1@example.com'
      fill_in "user[password]", with: 'testtest'
      click_button 'ログインする'
    end

    describe '新規作成機能' do
      context 'タスクを新規作成した場合' do
        it '作成したタスクが表示される' do
          visit new_task_path
          fill_in "task[name]", with: 'test1'
          click_button '登録する'
          expect(page).to have_content 'test1'
        end
      end
    end
    
    describe '一覧表示機能' do
      context '一覧画面に遷移した場合' do
        it '作成したタスクの一覧が表示される' do
          visit tasks_path
          expect(page).to have_content 'test1'
        end
      end

      context '一覧画面に遷移した場合' do
        it '編集したタスクがタスク一覧が表示される' do
          visit tasks_path
          click_on '編集する'
          fill_in "task[name]", with: 'test2'
          click_button '変更する'
          expect(page).to have_content 'test2'
        end
      end

      context '一覧画面に遷移した場合' do
        it 'タスクを削除した場合、削除しましたと表示される' do
          visit tasks_path
          click_on '削除する'
          page.driver.browser.switch_to.alert.accept
          expect { expect(page).to have_content "削除しました" }
        end
      end

      context '一覧画面に遷移した場合' do
        it '未達成の理由をクリックすると、' do
          visit tasks_path
          click_on '未達成の理由'
          expect(page).to have_content 'test1'
        end
      end
    end
  end  
end
