class JsonBuilder
  attr_reader :user
  def initialize(user)
    @user = user
  end

  def build
    jobs_json = {}
    jobs.each do |job|
      jobs_json[job.job_uid] = {}
      job_json = jobs_json[job.job_uid]
      job_json["count"] = job.applicants_jobs.count
    end
    return jobs_json
  end

  def jobs
    @jobs ||= user.loginable.jobs
  end
end
