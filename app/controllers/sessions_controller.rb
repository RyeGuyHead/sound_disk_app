class SessionsController < ApplicationController
    
    def new
        @title = "Sign in"
    end
    
    def create
        #reset_session
        user = User.authenticate(params[:session][:email],
                                 params[:session][:password])
        if user.nil?
            flash.now[:error] = "Invalid email/password combination."
            @title = "Sign in"
            render 'new'
            else
            sign_in user
            redirect_back_or user
        end
    end
    
    def destroy
        reset_session
        sign_out
        redirect_to root_path
    end
end