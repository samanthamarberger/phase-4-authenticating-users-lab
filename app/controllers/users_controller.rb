class UsersController < ApplicationController
    def show 
        user_id = session[:user_id]
        if user_id
            user = User.find_by(id: user_id)
            
            if user
              render json: user
            else
              render json: { error: 'User not found' }, status: :not_found
            end
        else
            render json: { error: 'User not authenticated' }, status: :unauthorized
        end
    end
end