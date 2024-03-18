class SessionsController < ApplicationController

    def new
    end

    def create 
        student = Student.find_by(email: params[:email])
        if student.present? && student.authenticate(params[:password])
            session[:student_id] = student.id 
            redirect_to root_path 
            flash[:alert]="Logged In Successfullt"
        else
            redirect_to sign_in_path
            flash[:alert] = "Invalid User Id or Email"
        end
    end
    
    def destroy
        session[:student_id]=nil 
        redirect_to root_path 
        flash[:alert]="Logged Out"
    end
end