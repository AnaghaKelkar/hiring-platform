class Address < ApplicationRecord
  belongs_to :applicant
  belongs_to :admin
  belongs_to :addressable, polymorphic: true
end
