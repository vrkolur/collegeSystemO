class ApplicationController < ActionController::Base
    before_action :set_current_student
    before_action :set_current_teacher


    
    def set_current_student
        if session[:student_id]
            Current.student = Student.find_by(id: session[:student_id])
        end
    end

    def require_student_logged_in?
        if Current.student.nil?
            redirect_to sign_in_path 
            flash[:alert]="You should be logged in" 
        end
    end

    def set_current_teacher
        if session[:teacher_id]
            Current.teacher = Teacher.find_by(id: session[:teacher_id])
        end
    end

end
