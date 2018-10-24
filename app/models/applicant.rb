class Applicant < ApplicationRecord
  has_one :user, as: :loginable
end
