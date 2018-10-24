class ApplicantsController < ApplicationController
  def edit
    @applicant = Applicant.find params[:id]
  end

  def update
    @applicant = Applicant.find params[:id]
    address = @applicant.address
    if @applicant.update(applicant_params)
      if address.present?
        if address.update(address_params)
          redirect_to @applicant
        else
          render 'edit'
        end
      else
        new_address = Address.new(address_params.merge(addressable: @applicant))
        if new_address.save
          render 'edit'
        else
          redirect_to @applicant
        end
      end
    end
  end

  def show
    @applicant = Applicant.find params[:id]
    @address = @applicant.address
  end

  def applied_jobs
    @jobs = Job.where(id: applicant.applicants_jobs.pluck(:job_id))
  end

  def jobs
    @jobs = Job.where(status: Job::ACTIVE)
  end

  def apply
    @job = Job.find(params[:id])
  end

  def submit
    ApplicantsJob.create!(job: Job.find(params[:id]), applicant: applicant)
    redirect_to jobs_applicants_path
  end

    private
      def applicant_params
        params.require(:applicant).permit(:mobile_number, :start_date, :degree, :roles_interested, :employers, :education)
      end

      def address_params
        params.require(:applicant).permit(:line_1, :line_2, :city, :state, :pincode, :country)
      end

      def applicant
        @applicant ||= current_user.loginable
      end
end