class TeachersController < ApplicationController 

    def students 
        if current_teacher == nil 
            redirect_to root_path
            flash[:alert]="Teacher must be logged in to View Students"
        else 
        @teacher = current_teacher
        end
    end

    def allstudents
        if current_teacher.id ==4
            @students = Student.all
        else 
            redirect_to root_path
            flash[:alert]="Only Root has acces to this Feild"
        end
    end

    def destroy 
        @student = Student.find(params[:id])
        message = @student.name
        @enrollments = @student.enrollments
        @student.destroy
        @enrollments.destroy
        redirect_to show_all_students_path
        flash[:alert]="#{message} deleted Successfully"
    end

end