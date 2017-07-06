class CompaniesController < ApplicationController
    def new
    end

    def create
        @company = Company.create!(
                                    name: params[:name],
                                    address: params[:address]
                                    )
        if @company.save
            flash[:success] = "Company successfully created!"
            redirect_to "companies/#{ @company.id }"
        else redirect_to '/companies/new'
            flash[:warning] = "Please submit again"
        end
    end

    def show
        @company = Company.find(params[:id])
    end

    def edit
        @company = Company.find(params[:id])
    end

    def update
        @company = Company.find(params[:id])
        @company.assign_attributes(
                                    name: params[:name],
                                    address: params[:address]
                                    )
        if @company.save
            flash[:success] = "Company Updated"
            redirect_to '/'
        else
            render 'edit.html.erb'
        end
    end

    def delete
        company = Company.find(params[:id])
        company.destroy
        flash[:danger] = "Company deleted"
        redirect_to '/'
    end
end
