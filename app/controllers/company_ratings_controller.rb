class CompanyRatingsController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @company_rating = @company.company_ratings.build 
  end

  def create
    @company = Company.find(params[:company_id])
    @company_rating = CompanyRating.new(company_rating_params)
    @company_rating.company = @company
    if @company_rating.save
      redirect_to @company
    else
      render 'new'
    end
  end

private
  def company_rating_params
    params.require(:company_rating).permit(:rating)
  end

end

