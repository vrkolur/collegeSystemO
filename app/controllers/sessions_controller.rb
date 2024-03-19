class SessionsController < ApplicationController

    def new_student

    end

    def new_teacher
        
    end

    def create_student
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

    def create_teacher 
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
    
    def destroy_student
        session[:student_id]=nil 
        redirect_to root_path 
        flash[:alert]="Logged Out"
    end

    def destroy_teacher
        session[:teacher_id]=nil 
        redirect_to root_path 
        flash[:alert]="Logged Out"
    end
    
end