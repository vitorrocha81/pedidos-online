class CompaniesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @companies = Company.new
  end

  def create
    @companies = Company.new(companies_params)
    if companies.save
      redirect_to @companies
    else
      render "new"
    end  
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def companies_params
    params.require(:company).permit(:name, :email, :phone, :street_address, :number_address, :city, :neighborhood)    
  end
end