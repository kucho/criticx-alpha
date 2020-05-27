class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  def index
    @companies = Company.all
  end

  def show
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :description, :start_date, :country)
  end
end
