class LikesController < ApplicationController
    def addlike
        unless Like.where(user_id: session[:user_id]).where(idea_id: params[:id]).exists?
            Like.create(user_id: session[:user_id], idea_id: params[:id])
            Idea.increment_counter(:likes_count, params[:id])
        end
        redirect_to request.referrer
    end
end
