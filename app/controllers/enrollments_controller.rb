class EnrollmentsController < ApplicationController
   
    def new
       @enrollment = Enrollment.new
       @cource = Cource.all
    end
   
    def create
       @enrollment = Enrollment.new(enrollment_params.merge(student_id: current_student.id))
       if @enrollment.save
        redirect_to root_path
        flash[:alert]="success enrollment"
    else
        redirect_to enroll_path 
        flash[:alert]="Already Enrolled choose a different Cource "
       end
    end

    def show 
      
    end
   
    private
   
    def enrollment_params
       params.require(:enrollment).permit(:cource_id)
    end
   end
   