class CompaniesController < ApplicationController
 before_action :authenticate_company_admin!, only: [:create, :new, :edit, :update]


  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company
    else
      render "new"
    end  
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to @company
    else
      render "new"
    end
  end

  def destroy
  end

  def company_params
    params.require(:company).permit(:name, :email, :phone, :street_address, :number_address, :city, :neighborhood)    
  end
end