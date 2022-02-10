class HospitalsController < ApplicationController

    def new
        @hospital = Hospital.new
    
    end

    def create
        @hospital = Hospital.new(hospital_params)
        
        if @hospital.save
          flash[:notice] = "New Hospital Registered Succesfully."
          redirect_to root_path
        else
          render 'new'
        end
    end


    private
      
    def hospital_params
        params.require(:hospital).permit(:hospital_id, :hospital_name, :address, :phone_no, :pin_code, :free_vac, :paid_vac)
    end
    
    



end 