module ApplicantsHelper
  def options_for_employers(employers)
  	employers.collect{ |u| [u.user.name, u.id] }
  end
end
