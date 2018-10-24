class Job < ApplicationRecord
  belongs_to :admin
  has_many :applicants_jobs

  validates :job_uid, presence: true
  validates :job_uid, uniqueness: true
  validates :title, presence: true
  validates :description, presence: true

  ACTIVE =  1
  INACTIVE =  2

  def applied?(user)
  	applicants(user).present?
  end

  def time_applied(user)
    applicants(user).first.created_at
  end

  def status_in_words
    status==Job::ACTIVE ? 'Active' : 'Closed'
  end

  def active?
    status==Job::ACTIVE
  end

    private
      def applicants(user)
        applicants_jobs.where(applicant: user.loginable)
      end
end
