class Applicant < ApplicationRecord
  has_one :user, as: :loginable
  has_one :address, as: :addressable
  has_many :applicants_jobs
end
