require 'rails_helper'

RSpec.describe 'Post', type: :system do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }

  context 'ログインしている場合' do
    before do
      visit new_user_session_path
      click_link('Sign up')
      fill_in('session_accountname', with: 'example0000')
      fill_in('session_email', with: 'example@example.com')
      fill_in('session_password', with: 'password')
      fill_in('session_password_confirmation', with: 'password')
      click_button('登録する')
    end

    it 'タイムラインが表示される' do
      visit posts_path
      expect(page).to have_content(Testgram)
    end
  end

end
