class Admin < ApplicationRecord
  has_one :user, as: :loginable
  has_many :jobs
end
