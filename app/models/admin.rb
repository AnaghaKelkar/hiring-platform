class Admin < ApplicationRecord
  has_one :user, as: :loginable
end
