class PasswordsController < ApplicationController
    before_action :require_student_logged_in?

    def edit

    end

    def update
        if current_student.update(password_params)
            redirect_to root_path 
            flash[:alert] = "Password Updated"
        else 
            redirect_to password_edit_path
            flash[:alert]="Password don't match" 
        end
    end

    private 
    def password_params 
        params.require(:student).permit(:password, :password_confirmation)
    end

end