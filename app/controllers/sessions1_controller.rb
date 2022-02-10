class Sessions1Controller < ApplicationController

    def create
        admin = Admin.find_by(username: params[:session1][:username].downcase)
        if admin && admin.authenticate(params[:session1][:password])
          session[:admin_id] = admin.id
          flash[:notice] = "admin Logged in successfully."
          redirect_to utable_path
        else
          flash.now[:alert] = "There was something wrong with your login details."
          render 'new'
        end
      end
       
      def destroy
        session.delete(:admin_id)
        session[:admin_id] = nil
        flash[:notice] = "You have been logged out."
        redirect_to root_path
      end


end