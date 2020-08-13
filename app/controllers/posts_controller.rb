class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
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

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to root_path, notice: '更新出来ました'
        else
            flash.now[:error] = '更新出来ませんでした'
            render :edit
        end
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy!
        redirect_to root_path, notice: '削除しました'
    end

    private
    def post_params
        params.require(:post).permit(
            :picture,
            :text
        )
    end
end