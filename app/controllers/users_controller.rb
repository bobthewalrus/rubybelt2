class UsersController < ApplicationController
    def index
        render 'index'
    end
    def register
        @user=User.create(name: params[:name], email: params[:email], password: params[:password])
        if (@user.errors.any?)
            flash[:msg]=@user.errors.full_messages
        else
            flash[:msg] = "User successfully registered!"
        end
        redirect_to '/'
    end

end
