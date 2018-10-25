class DashboardController < ApplicationController
  def admin
    @admin = current_user.loginable
    @jobs = @admin.jobs
  end

  def applicant
    @applicant = current_user.loginable
    @jobs = Job.where(id: @applicant.applicants_jobs.pluck(:job_id))
  end
end