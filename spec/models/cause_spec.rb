require 'rails_helper'

RSpec.describe 'Causeモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      before do
        @cause = FactoryBot.create(:cause)
      end

      context '原因の内容を空で投稿した場合' do
        it 'バリデーションにひっかかる' do
          @cause = Cause.new(content: '')
          expect(@cause).not_to be_valid #user_idがnilになってしまうので、botでasossiationしてるものを使ってる
        end
      end

      context '原因の内容を記載して投稿場合' do
        it 'バリデーションが通る' do
          expect(@cause).to be_valid
        end
      end
    end
  end