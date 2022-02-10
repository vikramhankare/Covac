class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
     
    def logged_in?
      !!current_user
    end

    helper_method :current_user1, :logged_in1?
    def current_user1
      @current_user1 ||= Admin.find(session[:admin_id]) if session[:admin_id]
    end

    def logged_in1?
      !!current_user1
    end

    helper_method :current_user2, :logged_in2?
    def current_user2
      @current_user2 ||= Sadmin.find(session[:sadmin_id]) if session[:sadmin_id]
    end

    def logged_in2?
      !!current_user2
    end


    


     
    def require_user
      if !logged_in?
        flash[:alert] = "You must be logged in to perform that action."
        redirect_to login_path
      end
    end

    def require_user
      if !logged_in1?
        flash[:alert] = "You must be logged in to perform that action."
        redirect_to login_path
      end
    end

    def require_user
      if !logged_in2?
        flash[:alert] = "You must be logged in to perform that action."
        redirect_to login_path
      end
    end
end
