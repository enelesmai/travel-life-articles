class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: 'Successfully signed up!'
        else
            flash.alert = 'User already exists!'
            render :new
        end
    end
    
    def user_params
        params.require(:user).permit(:name)
    end
end
