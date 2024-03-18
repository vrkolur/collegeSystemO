class TeachersController < ApplicationController 

    def students 
        if Current.teacher == nil 
            redirect_to root_path
            flash[:alert]="Teacher must be logged in to View Students"
        else 
        @teacher = Current.teacher
        end
    end

end