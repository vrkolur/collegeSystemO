class TeacherRegistrationsController < ApplicationController 

    def new 
        @teacher = Teacher.new 
        @cource = Cource.all
    end

    def create 
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

    private 
    def teacher_params
        params.require(:teacher).permit(:name, :email, :password, :password_confirmation, :cource_id)
    end

end
    