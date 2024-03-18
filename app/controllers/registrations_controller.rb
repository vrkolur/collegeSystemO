class RegistrationsController < ApplicationController

    def new 
        @student = Student.new 
    end

    def show 
        
    end

    def create 
        @student = Student.new(student_params)
        if @student.save
            session[:student_id]=@student.id 
            redirect_to root_path
            flash[:alert]="Successfully Registered"
        else 
            redirect_to register_path
            if @student.errors.any?
                @student.errors.full_messages.each do |message|
                    flash[:alert]=message
                end
            end
        end
    end

    def edit

    end

    def update 
        if Current.student.update(model_params) && !Current.student.nil?
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

    def model_params
        params.require(:student).permit(:name,:email,:address)
    end

end