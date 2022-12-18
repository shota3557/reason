require 'rails_helper'

RSpec.describe 'Userモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'ユーザ登録時に名前が空の場合' do
      it 'バリデーションにひっかる' do
        @user = User.new(name: '')
        expect(@user).not_to be_valid #user_idがnilになってしまうので、botでasossiationしてるものを使ってる
      end
    end

    context 'ユーザ登録時にメールアドレスが空の場合' do
        it 'バリデーションにひっかる' do
          @user = User.new(email: '')
          expect(@user).not_to be_valid #user_idがnilになってしまうので、botでasossiationしてるものを使ってる
        end
      end

      context 'ユーザ登録時にパスワードが空の場合' do
        it 'バリデーションにひっかる' do
          @user = User.new(password: '')
          expect(@user).not_to be_valid #user_idがnilになってしまうので、botでasossiationしてるものを使ってる
        end
      end

    context 'ユーザ登録時に画像以外全て記載した場合' do
      it 'バリデーションが通る' do
        expect(@user).to be_valid
      end
    end
  end
end
