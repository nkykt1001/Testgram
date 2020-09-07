class AccountsController < ApplicationController
    before_action :authenticate_user!

    def followings
        @user = User.find(params[:id])
        render 'accounts/followings'
    end

    def followers
        @user = User.find(params[:id])
        render = 'accounts/followers'
    end

    def show
        @user = User.find(params[:id])
        if @user == current_user
            redirect_to profile_path
        end
    end
end