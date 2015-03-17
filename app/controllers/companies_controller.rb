class CompaniesController < ApplicationController
  before_action :authenticate_company_admin!, only: [:create, :new, :edit, :update]
  before_action :check_company_from_current_admin, only: [:edit, :update]
  
  def index
    @companies = Company.all.order(created_at: :desc).limit(3)
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.company_admin = current_company_admin
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

private
  def company_params
    params.require(:company).permit(:name, :email, :cnpj, :phone, :street_address, :number_address, :city, :neighborhood)    
  end
  
  def check_company_from_current_admin
    company = Company.find(params[:id])
    if company != current_company_admin.company
    redirect_to root_path
    end 
  end
end