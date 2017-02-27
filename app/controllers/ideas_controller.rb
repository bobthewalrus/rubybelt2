class IdeasController < ApplicationController
    before_action :authorize
    def display
        @ideas1 = Idea.all.order(:likes_count).reverse
        @sortedlikes= Like.group(:idea_id).count.sort_by(&:last).reverse!

        render "display"
    end
    def make
        @idea = Idea.create(idea: params[:idea], user_id: session[:user_id])
        redirect_to "/ideas"
    end
    def delete
        user = User.find(session[:user_id])
        Idea.find(params[:id]).destroy if user == @current_user
        redirect_to request.referrer
    end
    def showinfo
        @ideas1 = Idea.find(id=params[:id])
        @likes = Like.select("user_id").where(idea_id: params[:id])
        @users1 = User.where(id: @likes).pluck(:id, :alias, :name)
        render "showinfo"
    end
end
