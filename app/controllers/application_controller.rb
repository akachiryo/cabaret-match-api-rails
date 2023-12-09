class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action do
    I18n.locale = :ja
  end

  def render_error(status, message, data = nil)
    response = {
                success: false,
                errors: message
               }
    response = response.merge(data) if data
    render json: response, status: status
  end
end
