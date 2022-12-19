require 'rails_helper'
RSpec.describe 'Solution管理機能', type: :system do
  describe do
    before do
      visit new_user_session_path 
      fill_in "user[email]", with: 'test1@example.com'
      fill_in "user[password]", with: 'testtest'
      click_button 'ログインする'
      task = Task.find(190)
      visit task_causes_path(task.id)          
      click_on '詳細を見る'
    end

    describe '新規作成機能' do
      context 'Solutionを新規作成した場合' do
        it '作成したSolutionが表示される' do
          click_on '深掘りを追加する'
          fill_in "cause[content]", with: 'cause1'
          fill_in "cause[solutions_attributes][0][content]", with: 'solution1'
          click_button '登録する'
          expect(page).to have_content 'solution1'
        end
      end
    end
  end  
end