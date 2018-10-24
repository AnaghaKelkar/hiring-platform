class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :loginable, polymorphic: true

  def is_admin?
  	loginable_type=='Admin'
  end

  def is_applicant?
  	loginable_type=='Applicant'
  end
end
