class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(username: params[:session][:username].downcase) # Find the user by username
        if user && user.authenticate(params[:session][:password]) # If the user exists and the password is correct
            session[:user_id] = user.id # Set the session to the user's id
            flash[:success] = "You have successfully logged in" # Flash a success message
            redirect_to root_path # Redirect to the root path
        else
            flash.now[:error] = "There was something wrong with your login information" # Flash an error message
            render 'new' # Render the new template
        end
    end

    def destroy
        session[:user_id] = nil # Set the session to nil
        flash[:success] = "You have logged out" # Flash a success message
        redirect_to login_path # Redirect to the login path
    end
end