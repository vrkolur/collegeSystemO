class TeacherSessionsController < ApplicationController

    def new
        
    end
    def create 
        teacher = Teacher.find_by(email: params[:email])
        if teacher.present? && teacher.authenticate(params[:password])
            session[:teacher_id] = teacher.id 
            redirect_to root_path 
            flash[:alert]="Logged In Successfullt"
            # flash[:alert]=session[:teacher_id]
        else
            redirect_to teacher_sign_in_path
            flash[:alert] = "Invalid User Id or Email"
        end
    end
    
    def destroy
        session[:teacher_id]=nil 
        redirect_to root_path 
        flash[:alert]="Logged Out"
    end
end