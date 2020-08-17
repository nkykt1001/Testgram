# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
class Post < ApplicationRecord
    validates :text, presence: true
    
    belongs_to :user
    has_one_attached :picture
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    def display_created_at
        I18n.l(self.created_at, format: :default)
    end

    def like_count
        likes.count
    end

end
