class ApplicationController < ActionController::Base
    helper_method :current_teacher
    helper_method :current_student
    # before_action :set_current_student
    # before_action :set_current_teacher


    
    # def set_current_student
    #     if session[:student_id]
    #         Current.student = Student.find_by(id: session[:student_id])
    #     end
    # end

    def require_student_logged_in?
        if current_student.student.nil?
            redirect_to sign_in_path 
            flash[:alert]="You should be logged in" 
        end
    end
    
    # def set_current_teacher
    #     if session[:teacher_id]
    #         current_teacher = Teacher.find_by(id: session[:teacher_id])
    #     end
    # end
    
    private
    def current_student
      @current_student = Student.find_by(id: session[:student_id]) if session[:student_id]
    end
    def current_teacher
      @current_teacher = Teacher.find_by(id: session[:teacher_id]) if session[:teacher_id]
    end

end
