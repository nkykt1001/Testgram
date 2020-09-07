class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
        post = Post.find(params[:post_id])
        post.likes.create!(user_id: current_user.id)
    end

    def destroy
        post = Post.find(params[:post_id])
        like = post.likes.find_by!(user_id: current_user.id)
        like.destroy!
    end

end