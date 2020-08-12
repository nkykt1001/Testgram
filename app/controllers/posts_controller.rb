class PostsController < ApplicationController
    def index
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path, notice: '保存出来ました'
        else
            flash.now[:error] = '保存出来ませんでした'
            render :new
        end
    end

    private
    def post_params
        params.require(:post).permit(
            :picture,
            :text
        )
    end
end