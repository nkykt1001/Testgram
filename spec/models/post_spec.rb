# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create(:user) } 

  context '画像選択とテキスト入力がされている場合' do
    let!(:post) { build(:post, user: user) }
 
    it '保存出来る' do
      expect(post).to be_valid
    end
  end

  context '画像が選択されていない場合' do
    let!(:post) { build(:post, picture: nil, user: user) }

    it '保存出来ない' do
      post.save
      expect(post.errors.messages[:picture][0]).to eq('を入力してください')
    end
  end

  context 'テキストが入力されていない場合' do
    let!(:post) { build(:post, content: nil, user: user) }

    it '保存出来ない' do
      post.save
      expect(post.errors.messages[:content][0]).to eq('を入力してください')
    end
  end
end
