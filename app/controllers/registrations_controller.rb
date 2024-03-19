class RegistrationsController < ApplicationController

    def new_student 
        @student = Student.new 
    end

    def new_teacher
        @teacher = Teacher.new 
        @cource = Cource.all
    end


    def create_student
        @student = Student.new(student_params)
        if @student.save
            session[:student_id]=@student.id 
            redirect_to root_path
            flash[:alert]="Successfully Registered"
        else 
            redirect_to register_student_path
            if @student.errors.any?
                @student.errors.full_messages.each do |message|
                    flash[:alert]=message
                end
            end
        end
    end

    def create_teacher
        @teacher = Teacher.new(teacher_params)
        if @teacher.save
            session[:teacher_id]=@teacher.id 
            redirect_to root_path
            flash[:alert]="Successfully Registered"
        else 
            redirect_to register_teacher_path
            if @teacher.errors.any?
                @teacher.errors.full_messages.each do |message|
                    flash[:alert]=message
                end
            end
        end
    end

    def edit_student

    end

    def update_student
        if current_student.update(student_model_params) && !current_student.nil?
            redirect_to root_path 
            flash[:alert]='Student was updates Successfully!'
        else 
            format.html {render:edit_profile }
            flash[:alert]="Unprocessable Entity"
        end
    end

    private 
    def student_params
        params.require(:student).permit(:name,:email,:address,:gender,:father_name,:password,:password_confirmation)
    end

    def student_model_params
        params.require(:student).permit(:name,:email,:address)
    end

    def teacher_params
        params.require(:teacher).permit(:name, :email, :password, :password_confirmation, :cource_id)
    end

end