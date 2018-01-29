class Employers::EmployersController < BaseNotificationsController
  layout "employers/employer"

  before_action :authenticate_user!
  before_action :load_company
  before_action :check_permissions_employer
  before_action :current_ability
  before_action :load_notifications
  load_and_authorize_resource

  private

  def load_members
    @members = @company.members
  end

  def load_templates
    @template_members = current_user.templates.template_member
    @template_users = current_user.templates.template_user
  end

  def check_permissions_employer
    return if current_user.is_employer_of? @company.id
    flash[:danger] = t "company_mailer.fail"
    redirect_to root_url
  end

  def get_step_by_company
    @company_steps_by_step = @company.company_steps.includes(:step).group_by &:step_id
    @steps = @company.steps
  end

  def load_current_step
    @current_apply_status = @apply.apply_statuses.includes(:status_step).find_by is_current: :current
    @current_step = @current_apply_status.step if @current_apply_status.present?
  end

  def load_next_step
    @company_steps_by_current = @company_steps_by_step[@current_step.id].first
    @next_step = if @company_steps_by_current.present?
      @company_steps_by_current.load_step @company, Settings.next_step
    end
  end

  def load_prev_step
    @prev_step = if @company_steps_by_current.present?
      @company_steps_by_current.load_step @company, Settings.prev_step
    end
  end

  def load_statuses_by_current_step
    @current_status_steps = @current_step.status_steps
  end

  def build_apply_statuses
    @apply_status = @apply.apply_statuses.build is_current: :current, status_step_id: @current_apply_status.status_step_id
  end

  def load_status_step_scheduled
    @company_stattus_step_ids = @company.status_steps.load_by(Settings.scheduled).pluck(:id)
  end

  def load_status_step_interview_scheduled
    @interview_scheduled_ids = @company.status_steps.load_by(Settings.interview_scheduled).pluck(:id)
  end

  def build_next_and_prev_apply_statuses
    if @next_step.present?
      @next_apply_status = @apply.apply_statuses.build is_current: :current,
        status_step_id: @next_step.status_steps.first.id
    end

    if @prev_step.present?
      @prev_apply_status = @apply.apply_statuses.build is_current: :current,
        status_step_id: @prev_step.status_steps.first.id
    end
  end

  def load_apply_statuses
    @apply_statuses = @apply.apply_statuses.includes(:status_step,
      appointment: [inforappointments: [:user]]).page params[:page]
  end

  def load_steps
    @steps = @company.steps.includes(:status_steps)
  end

  def load_statuses
    @status_steps = @company.status_steps
  end
end
