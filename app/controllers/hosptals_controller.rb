class HosptalsController < ApplicationController

    
    def htable
        @hosptals = Hosptal.all
    end
    
    def requesttable
        @hosptals = Hosptal.all
    end

    def new
        @hosptal = Hosptal.new
    
    end

    def create
        @hosptal = Hosptal.new(hosptal_params)
        
        if @hosptal.save
          flash[:notice] = "New Hospital Registered Succesfully."
          redirect_to htable_path
        else
          render 'new'
        end
    end

    def updatefree

        @hosptal = Hosptal.find(params[:id])
        @free_vac = @hosptal.free_vac
        @free_vac = @free_vac - 1
        @hosptal.write_attribute(:free_vac, @free_vac)
        @hosptal.save
        redirect_to confirm_path
    end

    def updatepaid
        @hosptal = Hosptal.find(params[:id])
        @paid_vac = @hosptal.paid_vac
        @paid_vac = @paid_vac - 1
        @hosptal.write_attribute(:paid_vac, @paid_vac)
        @hosptal.save
        redirect_to confirm_path
    end


    def fullfilorderfree

        @hosptal = Hosptal.find(params[:id])
        @free_vac = @hosptal.free_vac
        @free_vac = @free_vac + 10
        @hosptal.write_attribute(:free_vac, @free_vac)
        @hosptal.save
        redirect_to requesttable_path
    end


    def fullfilorderpaid
        @hosptal = Hosptal.find(params[:id])
        @paid_vac = @hosptal.paid_vac
        @paid_vac = @paid_vac + 10
        @hosptal.write_attribute(:paid_vac, @paid_vac)
        @hosptal.save
        redirect_to requesttable_path
    end


    def minusonefree
        @hosptal = Hosptal.find(params[:id])
        @free_vac = @hosptal.free_vac
        if @free_vac!=0
            @free_vac = @free_vac - 1
            @hosptal.write_attribute(:free_vac, @free_vac)
        else
            @hosptal.write_attribute(:free_vac, @free_vac)
        end
        @hosptal.save
        redirect_to htable_path
    end

    def minusonepaid
        @hosptal = Hosptal.find(params[:id])
        @paid_vac = @hosptal.paid_vac
        if @paid_vac!=0
            @paid_vac = @paid_vac - 1
            @hosptal.write_attribute(:paid_vac, @paid_vac)
        else
            @hosptal.write_attribute(:paid_vac, @paid_vac)
        end
        @hosptal.save
        redirect_to htable_path
    end

    def minustenfree
        @hosptal = Hosptal.find(params[:id])
        @free_vac = @hosptal.free_vac
        if @free_vac!=0
            @free_vac = @free_vac - 10
            @hosptal.write_attribute(:free_vac, @free_vac)
        else
            @hosptal.write_attribute(:free_vac, @free_vac)
        end
        @hosptal.save
        redirect_to htable_path
    end


    def minustenpaid
        @hosptal = Hosptal.find(params[:id])
        @paid_vac = @hosptal.paid_vac
        if @paid_vac!=0
            @paid_vac = @paid_vac - 10
            @hosptal.write_attribute(:paid_vac, @paid_vac)
        else
            @hosptal.write_attribute(:paid_vac, @paid_vac)
        end
        @hosptal.save
        redirect_to htable_path
    end


   




    def checkuser

        
        
        @value=params[:username]+".com"
        @user = User.where({:email_id=>@value})
        if @user
            @noofva=@user[0].noofvacc + 1
           if @noofva<=2
                User.where(email_id: @value).update_all(noofvacc:@noofva )
               if @noofva==1
                    User.where(email_id: @value).update_all(vaccine_status:"Partially Vaccinated" )
               else  
                User.where(email_id: @value).update_all(vaccine_status:"Vaccinated" )       
              end
           end
        end
       redirect_to uprofile_path
        # @user = User.find_by(username: params[:username])
        #  @countvac = @ckuser.noofvacc
        #  @countvac = @countvac + 1
         #render json:@user.username

        #  @ckuser.write_attribute(:noofvacc, @countvac)
        #  @ckuser.save
        #  redirect_to uprofile_path
        
        
        
        
        # if logged_in?
        #     @countvac = current_user.noofvacc
        #     @countvac = @countvac + 1
        #     current_user.write_attribute(:noofvacc, @countvac)
        #     current_user.save
        # end
        # redirect_to uprofile_path

        # if @countvac==0
        #     @ckuser.write_attribute(:noofvacc, 1)
        # end
        # if @countvac==1
        #     @ckuser.write_attribute(:noofvacc, 2)
        # end
            
        # @ckuser.save

        




        # @countvac = @countvac + 1
        # # @ckuser.update(noofvacc:@countvac)
        # @ckuser.update_attributes(noofvacc: '@countvac')
        
        # @ckuser.save

        
        # render json:@ckuser

    end

    
    



    private
      
    def hosptal_params
        params.require(:hosptal).permit(:hospital_id, :hospital_name, :address, :phone_no, :pin_code, :free_vac, :paid_vac)
    end
    
    



end 