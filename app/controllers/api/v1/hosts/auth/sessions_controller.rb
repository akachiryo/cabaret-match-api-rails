class Api::V1::Hosts::Auth::SessionsController < Devise::ConfirmationsController
  def create
    host = Host.find_by(email: params[:email])
    if host && host.valid_password?(params[:password])

      token = host.create_new_auth_token

      render json: {
        data: host.as_json.merge({
          access_token: token['access-token'],
          client: token['client'],
          uid: token['uid']
        })
      }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
