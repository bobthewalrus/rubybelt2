class SessionsController < ApplicationController
    def new
    end
    def create
        user= User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id]= user.id
            flash[:msg]="Successfully logged in!"
            redirect_to '/ideas'
        else
            flash[:msg]="Something went wrong!"
            redirect_to '/'
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end
end
