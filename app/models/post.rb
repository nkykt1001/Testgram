class Post < ApplicationRecord
    validates :picture, presence: true
    validates :text, presence: true
    
    belongs_to :user
    has_many :comments, dependent: :destroy

end
