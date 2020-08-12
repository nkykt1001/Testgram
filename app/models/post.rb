class Post < ApplicationRecord
    validates :picture, presence: true
    validates :text, presence: true
    
    belongs_to :user
end
