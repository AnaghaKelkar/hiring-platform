class DashboardController < ApplicationController
  def admin
    @admin = current_user.loginable
    @address = @admin.address
    @jobs = @admin.jobs
  end

  def applicant
    @applicant = current_user.loginable
    @address = @applicant.address
    @jobs = Job.where(id: @applicant.applicants_jobs.pluck(:job_id))
  end
end