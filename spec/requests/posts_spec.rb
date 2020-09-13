require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }

  describe 'GET /posts' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it 'タイムラインが表示される' do
        get root_path
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面が表示される' do
        get root_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  
end
