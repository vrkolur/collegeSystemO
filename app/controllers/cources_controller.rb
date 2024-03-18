class CourcesController < ApplicationController
    def new 
        @cource  = Cource.new 
    end

    def show
        @cources = Cource.all
    end

    def create 
        @cource = Cource.new(cource_params)
        if @cource.save 
            redirect_to root_path 
            flash[:alert]="Cource Created Successfully"
        else 
            redirect_to add_cource_path 
            if @cource.errors.any?
                @cource.errors.full_messages.each do |message|
                    flash[:alert]=message
                end 
            end
        end
    end

    private 
    def cource_params
        params.require(:cource).permit(:name,:length)
    end
end