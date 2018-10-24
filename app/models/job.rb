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
  	applicants_jobs.where(applicant: user.loginable).present?
  end
end
