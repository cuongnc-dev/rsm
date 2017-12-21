class CompaniesController < ApplicationController
  layout "companies/company"

  before_action :authenticate_user!, only: %i(update edit destroy)
  before_action :load_company, only: %i(edit update show)
  before_action :load_partners, only: :show
  before_action :load_activities, only: :show

  def show; end

  def edit; end

  def update
    if @company.update_attributes company_params
      flash[:success] = t "update_success"
    else
      flash[:danger] = t "can_not_update"
    end
    redirect_to company_path
  end

  private

  def company_params
    params.require(:company).permit :name, :address, :majors, :contact_person,
      :phone, :company_info, :banner, :logo
  end

  def load_partners
    @partners = @company.partners
  end

  def load_activities
    @activities = @company.activities
  end
end
