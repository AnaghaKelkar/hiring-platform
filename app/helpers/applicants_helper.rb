module ApplicantsHelper
  def options_for_employers(employers)
  	employers.collect{ |u| [u.user.try(:name), u.id] }
  end
end
