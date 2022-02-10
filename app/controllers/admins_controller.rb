class AdminsController < ApplicationController
    
    def new
        @admin = Admin.new
    
    end

    def create
        @admin = Admin.new(admin_params)
        
        if @admin.save
          flash[:notice] = "admin created."
          redirect_to login_path
        else
          render 'new'
        end
    end

    def edit
        if !logged_in?
            #redirect to login page
        else 
            #do stuff
        end
       
    
    
    end
      
    
    
    
    private
      
        def admin_params
            params.require(:admin).permit(:username, :password)
        end
        
    

        
        
            
    
    
    

end
