class Job < ApplicationRecord
  belongs_to :admin
  has_many :applicants_jobs
end
