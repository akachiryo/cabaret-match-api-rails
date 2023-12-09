class HostBaseController < ApplicationController
  before_action :authenticate_host!

  def authenticate_host!
    access_token = request.headers['access-token']
    client = request.headers['client']
    uid = request.headers['uid']

    if access_token.blank? || client.blank? || uid.blank?
      return render_authenticate_error
    end

    host = Host.find_by(uid: uid)
    if host && host.valid_token?(access_token, client)
      @current_host = host
    else
      render_authenticate_error
    end
  end

  def current_host
    @current_host
  end

  def render_authenticate_error
    message = I18n.t('controllers.host.activate.errors.unauthorized')
    render_error(401, message)
  end

  private

  def render_error(status, message)
    render json: { error: message }, status: status
  end
end
