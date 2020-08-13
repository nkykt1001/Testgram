class CommentsController < ApplicationController
    def new
        post = Post.find(params[:post_id])
        @comment = post.comments.build
    end

    def create
        post = Post.find(params[:post_id])
        @comment = post.comments.build(comment_params)
        if @comment.save
            redirect_to post_path(post), notice: 'コメントを投稿しました'
        else
            flash.now[:error] = 'コメントの投稿に失敗しました'
            render :new
        end
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end