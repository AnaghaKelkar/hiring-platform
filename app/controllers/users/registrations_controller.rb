module Users
  class RegistrationsController < Devise::RegistrationsController
    def create
      loginable = create_loginable(params[:user][:loginable])
      build_resource(registration_params)
      resource.loginable = loginable
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end

    def after_update_path_for(resource)
      if resource.is_admin?
        dashboard_admin_path
      else
        dashboard_applicant_path
      end
    end

      private
        def registration_params
          params.require(:user).permit(:email, :name, :password, :password_confirmation)
        end

        def create_loginable(loginable)
          return loginable=='Admin' ? Admin.create! : Applicant.create!
        end
  end
end
