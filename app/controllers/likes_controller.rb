class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
        @post = Post.find(params[:post_id])
        @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
        @like.save
        @likes = Like.where(post_id: params[:post_id])
    end

    def destroy
        @post = Post.find(params[:post_id])
        like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
        like.destroy
        @likes = Like.where(post_id: params[:post_id])
    end

end