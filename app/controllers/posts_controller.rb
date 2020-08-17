class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @posts = Post.all.order(created_at: :desc)
    end

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
    end

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to root_path, notice: '投稿しました'
        else
            flash.now[:error] = '投稿出来ませんでした'
            render :new
        end
    end

    def edit
        @post = current_user.posts.find(params[:id])
    end

    def update
        @post = current_user.posts.find(params[:id])
        if @post.update(post_params)
            redirect_to root_path, notice: '投稿を更新しました'
        else
            flash.now[:error] = '投稿を更新出来ませんでした'
            render :edit
        end
    end

    def destroy
        post = current_user.posts.find(params[:id])
        post.destroy!
        redirect_to root_path, notice: '投稿を削除しました'
    end

    private
    def post_params
        params.require(:post).permit(
            :picture,
            :text
        )
    end
end