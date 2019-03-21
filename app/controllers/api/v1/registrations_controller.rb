class Api::V1::RegistrationsController < ActionController::API
  respond_to :json

  def create
    # binding.pry
    user = User.new
    user.email = params[:email]
    user.password = params[:password]
    if user.save
      render :json => user.as_json(:auth_token=>user.authentication_token, :email => user.email ), :status=>201
      return
    else
      warden.custom_failure!

      render :json => user.errors, :status=>422
    end
  end

  private
    # def user_params
    #   params.require(:user).permit(:email, :password, :password_confirmation)
    # end
end
