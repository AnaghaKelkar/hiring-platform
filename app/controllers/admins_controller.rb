class AdminsController < ApplicationController
  def edit
    @admin = Admin.find params[:id]
  end

  def update
    @admin = Admin.find params[:id]
    address = @admin.address
    if @admin.update(admin_params)
      if address.present?
        if address.update(address_params)
          redirect_to @admin
        else
          render 'edit'
        end
      else
        new_address = Address.new(address_params.merge(addressable: @admin))
        if new_address.save
          redirect_to @admin
        else
          render 'edit'
        end
      end
    end
  end

  def show
    @admin = Admin.find params[:id]
    @address = @admin.address
  end

    private
      def admin_params
        params.require(:admin).permit(:title, :mobile_number, :founded_in, :size, :positions, :hiring)
      end

      def address_params
        params.require(:admin).permit(:line_1, :line_2, :city, :state, :pincode, :country)
      end

      def admin
        @admin ||= current_user.loginable
      end
end