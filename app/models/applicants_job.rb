class ApplicantsJob < ApplicationRecord
  belongs_to :applicant_id
  belongs_to :job_id
end
