class Post < ApplicationRecord
    validates :text, presence: true
    
    belongs_to :user
    has_one_attached :picture
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    def like_count
        likes.count
    end

end
