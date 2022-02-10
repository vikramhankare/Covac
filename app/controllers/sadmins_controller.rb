class SadminsController < ApplicationController
    
    def new
        @sadmin = Sadmin.new
    
    end

    def create
        @sadmin = Sadmin.new(sadmin_params)
        
        if @sadmin.save
          flash[:notice] = "Sadmin created."
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
            params.require(:sadmin).permit(:username, :password)
        end
        
    

        
        
            
    
    
    

end
