class Applicant < ApplicationRecord
  has_one :user, as: :loginable
  has_many :applicants_jobs
  has_one :address
end
