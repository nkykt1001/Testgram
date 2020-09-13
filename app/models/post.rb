# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :picture, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    validates :picture, presence: true
    validates :content, presence: true

    def has_liked?(user_id)
        likes.find_by(user_id: user_id)
    end

    def like_count
        likes.count
    end

end
