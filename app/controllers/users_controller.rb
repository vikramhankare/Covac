class UsersController < ApplicationController

    def uprofile
    end

    def certificate
    end
    
    
    # def show
    #     respond_to do |format|
    #       format.html
    #       format.pdf do
    #         render pdf: "file_name" , template: "users/uprofile.html.erb"   # Excluding ".pdf" extension.
    #       end
    #     end
    #   end

    def show
        respond_to do |format|
          format.html
          format.pdf do
            pdf = UserPdf.new(@users)
            
            send_data pdf.render, filename: 'certfificate.pdf', type: 'application/pdf', disposition: "inline"
            redirect_to uprofile_path
          end
        end
    end
    
    def utable
        @users = User.all
    end
    
    def new
        @user = User.new
    
    end
# "first_name"
        # t.string "last_name"
        # t.string "gender"
        # t.string "vaccine_status"
        # t.string "aadhaar"
        # t.string "email_id"
        # t.string "phone_no"
        # t.string "address"
        # t.string "pin_code"
    def create
        @user = User.new(user_params)
        # @user=User.new
        # @user.username = params[:username]
        # @user.password = params[:password]
        # @user.first_name = params[:first_name]
        # @user.last_name = params[:last_name]
        # @user.vaccine_status = params[:vaccine_status]
        # @user.aadhaar = params[:aadhaar]
        # @user.email_id = params[:email_id]
        # @user.phone_no = params[:phone_no]
        # @user.address = params[:address]
        # @user.pin_code = params[:pin_code]
        # @user.save
        # @user = User.new(user_params)
        if @user.save
          flash[:notice] = "User created."
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

    def grantvac
        @user = User.find(params[:id])
        @vaccount = @user.noofvacc
        @vaccount = @vaccount + 1
        
        @user.write_attribute(:noofvacc, @vaccount)
        @user.save
        # render json:@user
        

        redirect_to uprofile_path
    end


    def grantvacs
        @user = User.find(params[:id])
        @vaccount = @user.vcount

        if  @vaccount.eql?("0")
            @user.write_attribute(:vcount, 1)
        end
        if @vaccount.eql?("1")
            @user.write_attribute(:vcount, 2)
        end
            
        
        
        @user.save
        # render json:@user
        

        redirect_to utable_path
    end


    def bookslot
        @hosptals = Hosptal.all
    end

    def bookfree

        
        @user.username =  Hosptal.find_by(id:params[:id])

    end


    def bookpaid
        
    
    
    end


    


      
    
    
    
    private
      
        def user_params
            params.require(:user).permit(:username, :password, :first_name, :last_name, :gender, :vaccine_status, :aadhaar, :email_id, :phone_no, :address, :pin_code, :noofvacc, :vcount)
        end
        
        # "first_name"
        # t.string "last_name"
        # t.string "gender"
        # t.string "vaccine_status"
        # t.string "aadhaar"
        # t.string "email_id"
        # t.string "phone_no"
        # t.string "address"
        # t.string "pin_code"


end