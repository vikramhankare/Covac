class Sessions2Controller < ApplicationController

    def create
        sadmin = Sadmin.find_by(username: params[:session2][:username].downcase)
        if sadmin && sadmin.authenticate(params[:session2][:password])
          session[:sadmin_id] = sadmin.id
          flash[:notice] = "Sadmin Logged in successfully."
          redirect_to requesttable_path
        else
          flash.now[:alert] = "There was something wrong with your login details."
          render 'new'
        end
      end
       
      def destroy
        session.delete(:sadmin_id)
        session[:sadmin_id] = nil
        flash[:notice] = "You have been logged out."
        redirect_to root_path
      end


end