require 'rails_helper'

RSpec.describe 'Taskモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
      @task = FactoryBot.create(:task)
    end
    context 'タスクの名前を空で登録した場合' do
      it 'バリデーションにひっかる' do
        @task = Task.new(name: '')
        expect(@task).not_to be_valid #user_idがnilになってしまうので、botでasossiationしてるものを使ってる
      end
    end
    context 'タスクの名前を記載して投稿した場合' do
      it 'バリデーションが通る' do
        task = Task.new(name: 'test1')
        expect(@task).to be_valid
      end
    end
  end
end

