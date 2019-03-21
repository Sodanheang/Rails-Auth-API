class Api::V1::SessionsController < ActionController::API
  respond_to :json

  def create
    user = User.find_by(:email => params[:email])
    unless user.nil?
      if user.valid_password? params[:password]
        sign_in(user, scope: :user)
        render :json => user, status: 200
        return
      end
    end
    render :json => '{"error": "invalid email and password combination"}'
  end

  def destroy
    sign_out(current_api_v1_user)
    render :json => '{"msg": "Successfully Sign Out"}'
  end

end
