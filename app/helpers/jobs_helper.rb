module JobsHelper
  def options_for_applicants(applicants)
  	applicants.collect{ |u| [u.user.name, u.id] }
  end
end
