class JobsController < ApplicationController
  def index
    @jobs = admin.jobs
  end

  def new
    @job = Job.new
    @flag = true
  end

  def create
    @job = Job.new(job_params.merge(status: Job::ACTIVE).merge(admin: admin))
    if @job.save
      redirect_to @job
    else
      render 'new'
    end
  end

  def show
    @job = job(params[:id])
  end

  def applicants
    @job = job(params[:id])
    @options_for_applicants = Applicant.where(id: @job.applicants_jobs.pluck(:applicant_id))
    if params[:applicant].present?
      @applicants = Applicant.where(id: params[:applicant])
    else
      @applicants = @options_for_applicants
    end
  end

  def status
    @job = job(params[:id])
    if @job.active?
      @job.update(status: Job::INACTIVE)
    else
      @job.update(status: Job::ACTIVE)
    end
    redirect_to jobs_path
  end

    private
      def job_params
        params.require(:job).permit(:job_uid, :title, :description, :minimum_requirement)
      end

      def admin
        @admin ||= current_user.loginable
      end

      def job(id)
        @job ||= Job.find id
      end
end