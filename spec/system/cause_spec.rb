require 'rails_helper'
RSpec.describe 'Cause管理機能', type: :system do
  describe do
    before do
      visit new_user_session_path 
      fill_in "user[email]", with: 'test1@example.com'
      fill_in "user[password]", with: 'testtest'
      click_button 'ログインする'
    end

    describe '新規作成機能' do
      context 'Causeを新規作成した場合' do
        it '作成したCauseが表示される' do
          visit new_task_path
          fill_in "task[name]", with: 'test1'
          fill_in "task[causes_attributes][0][content]", with: 'cause1'
          click_on 'できない理由を追加する'
          click_button '登録する'
          expect(page).to have_content '登録完了しました'
        end
      end
    end

    describe '一覧表示機能' do
      context '一覧画面に遷移した場合' do
        it '作成したCauseの一覧が表示される' do
          user = FactoryBot.create(:user, email: 'test@example.com')
          task = FactoryBot.create(:task, name: 'task1', user: user)
          cause = FactoryBot.create(:cause, content: 'cause1', task: task)
          visit task_causes_path(task.id)
          expect(page).to have_content 'cause1'
        end
      end
    end  

    describe '詳細画面機能' do
      context 'Cause詳細画面に遷移したい場合' do
        it 'Task一覧画面から詳細を見るをクリックすると遷移する' do
          task = Task.find(190)
          visit task_causes_path(task.id)          
          click_on '詳細を見る'
          expect(page).to have_content '「test1」ができない原因'
        end
      end 

      context 'Cause詳細画面に遷移した場合' do
        it 'Causeを編集すると編集後のCauseが表示される' do
          task = Task.find(190)
          visit task_causes_path(task.id)          
          click_on '詳細を見る'
          click_on '編集する'
          fill_in "cause[content]", with: 'test2'
          click_button '登録する'
          expect(page).to have_content '編集した'
        end
      end

      context 'Cause詳細画面に遷移した場合' do
        it 'Causeを削除すると、削除しましたと表示される' do
          task = Task.find(190)
          visit task_causes_path(task.id)          
          click_on '詳細を見る'
          click_on '削除する'
          page.driver.browser.switch_to.alert.accept
          expect { expect(page).to have_content "削除した" }
        end
      end
    end
  end  
end
