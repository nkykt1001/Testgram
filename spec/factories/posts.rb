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
FactoryBot.define do
    factory :post do
        picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/default-avatar.png')) }
        content { Faker::Lorem.characters(number: 3) }
    end
end
