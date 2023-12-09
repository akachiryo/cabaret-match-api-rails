class V1::Hosts::Auth::ConfirmationsController < Devise::ConfirmationsController
  respond_to :json

  private

  def after_confirmation_path_for(resource_name, resource)
    'http://localhost:8080'
  end
end
